local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol(
            {
                search = vim.fin.input("Grep > ")
            })
    end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
    vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev() end, opts)
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
    cmp_lsp.default_capabilities())

require('mason').setup({})
require('mason-lspconfig').setup({
    -- for web 
    -- ensure_installed = { "lua_ls", "angularls", "pyright", "html", "clangd" },
    ensure_installed = { "lua_ls", "pyright", "clangd" },
    handlers = {
        lsp_zero.default_setup,
        function(server)
            lsp_config[server].setup({
                capabilities = capabilities,
                on_attach = lsp_zero.on_attach,
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

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    formatting = lsp_zero.cmp_format(),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

