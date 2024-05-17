return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- LSP Support
        { 'neovim/nvim-lspconfig' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },

        { "pmizio/typescript-tools.nvim" },

        -- Snippets
        {
            'L3MON4D3/LuaSnip',
            dependencies = { 'rafamadriz/friendly-snippets' }
        },
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()
        -- local ts_lsp = require('lazy-setup.plugins.lsp.ts-lsp')

        lsp_zero.on_attach(function(client, bufnr)
            -- disabling for cs
            if client.name == "cs" then
                vim.cmd [[ LspStop ]]
            end

            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })

            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function()
                vim.lsp.buf.workspace_symbol(vim.fn.input("Grep > "))
            end, opts)
            vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
            vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
            vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        local lsp_config = require('lspconfig')
        --local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()
        local cmp_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require('mason').setup({})
        require('mason-lspconfig').setup({
            -- for web
            -- ensure_installed = { "lua_ls", "angularls", "pyright", "html", "clangd" },
            ensure_installed = { "lua_ls", "pyright", "clangd", "volar" },
            handlers = {
                lsp_zero.default_setup,
                function(server)
                    lsp_config[server].setup({
                        capabilities = capabilities,
                        on_attach = lsp_zero.on_attach,
                    })
                end,
                ["tsserver"] = function()
                    lsp_config.tsserver.setup({
                        capabilities = capabilities,
                        on_attach = lsp_zero.on_attach,
                        init_options = {
                            plugins = {
                                {
                                    name = "@vue/typescript-plugin",
                                    location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                                    languages = { "javascript", "typescript", "vue" },
                                },
                            },
                        },
                        filetypes = {
                            "javascript",
                            "typescript",
                            "vue",
                        },
                    })
                end,
                ["volar"] = function()
                    -- Directly setup Volar outside mason-lspconfig handlers if issues persist
                    lsp_config.volar.setup({
                        cmd = { 'vue-language-server', '--stdio' },
                        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
                        capabilities = capabilities,
                        on_attach = lsp_zero.on_attach,
                        init_options = {
                            vue = {
                                hybridMode = false,
                            },
                            typescript = {
                                tsdk =
                                "/Users/artem/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/tsserverlibrary"
                            },
                            languageFeatures = {
                                references = true,
                                definition = true,
                                typeDefinition = true,
                                callHierarchy = true,
                                hover = true,
                                rename = true,
                                renameFileRefactoring = true,
                                signatureHelp = true,
                                codeAction = true,
                                workspaceSymbol = true,
                                completion = {
                                    defaultTagNameCase = 'both',
                                    defaultAttrNameCase = 'kebabCase',
                                    getDocumentNameCasesRequest = false,
                                    getDocumentSelectionRequest = false
                                },
                                schemaRequestService = true,
                                diagnostics = true
                            },
                            documentFeatures = {
                                selectionRange = true,
                                foldingRange = true,
                                linkedEditingRange = true,
                                documentSymbol = true,
                                documentColor = true,
                                documentFormatting = {
                                    defaultPrintWidth = 100
                                }
                            }
                        },
                    })
                end,
                ["clangd"] = function()
                    lsp_config.clangd.setup({
                        capabilities = capabilities,
                        on_attach = lsp_zero.on_attach,
                        root_dir = lsp_config.util.root_pattern(
                            "compile_commands.json",
                            "compile_flags.txt",
                            ".git"),
                    })
                end,
                ["angularls"] = function()
                    lsp_config.angularls.setup({
                        capabilities = capabilities,
                        on_attach = lsp_zero.on_attach,
                        root_dir = lsp_config.util.root_pattern("angular.json", "package.json"),
                    })
                end,
                ["lua_ls"] = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lsp_config.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }

        })

        lsp_zero.setup()

        local ls = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'nvim_lua' },
                { name = 'luasnip', priority = 100 },
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if ls.expandable() then
                        ls.expand()
                    elseif cmp.visible() then
                        cmp.select_next_item()
                    elseif ls.jumpable(1) then
                        ls.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if ls.jumpable(-1) then
                        ls.jump(-1)
                    elseif cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' })
            },
            -- mapping = cmp.mapping.preset.insert({
            --     ['<Tab>'] = cmp_action.luasnip_supertab(),
            --     ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            --     ['<CR>'] = cmp.mapping.confirm({ select = true }),
            -- }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
    end
}
