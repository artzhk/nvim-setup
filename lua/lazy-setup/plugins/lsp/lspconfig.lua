return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		-- LSP Support
		{ "neovim/nvim-lspconfig" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },

		{ "pmizio/typescript-tools.nvim" },

		-- C# Support
		{ "Hoffs/omnisharp-extended-lsp.nvim" },

		-- Snippets
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local lsp_core = require("lazy-setup.plugins.lsp.lsp_core")

		-- lsp_core:init(lsp_zero, cmp_lsp)

		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			local opts = { buffer = bufnr, remap = true }
			lsp_core:config_keymaps(client, bufnr, opts)
		end)

		-- require("omnisharp_extended").lsp_definitions()
		-- local ts_lsp = require('lazy-setup.plugins.lsp.ts-lsp')

		local autocommands = require("core.autocommands")
		local lsp_config = require("lspconfig")

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		local pyright_config = require("lazy-setup.configs.ls.pyright")

		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			-- for web
			-- ensure_installed = { "lua_ls", "angularls", "pyright", "html", "clangd", omnisharp, "tsserver", "eslint"},
			ensure_installed = { "lua_ls", "tsserver", "clangd" },
			handlers = {
				lsp_zero.default_setup,
				function(server)
					lsp_config[server].setup({
						capabilities = capabilities,
						on_attach = lsp_zero.on_attach,
					})
				end,

				["omnisharp"] = function()
					require("omnisharp_extended").lsp_definitions()
					lsp_config.omnisharp.setup({
						capabilities = capabilities,
						on_attach = lsp_zero.on_attach,
					})
				end,
				["eslint"] = function()
					lsp_config.eslint.setup({
						capabilities = capabilities,
						on_attach = autocommands.eslint_on_save,
					})
				end,
				["pyright"] = function()
					lsp_config.pyright.setup({
						capabilities = capabilities,
						on_attach = lsp_zero.on_attach,
						default_config = pyright_config.default_config,
						commands = pyright_config.commands,
					})
				end,
				["tsserver"] = function()
					lsp_config.tsserver.setup({
						capabilities = capabilities,
						on_attach = lsp_zero.on_attach,
						init_options = {
							plugins = {
								-- {
								-- 	name = "@vue/typescript-plugin",
								-- 	location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
								-- 	languages = { "javascript", "typescript", "vue" },
								-- },
							},
						},
						filetypes = {
							"javascript",
							"typescript",
							"typescriptreact",
							"javascriptreact",
							"vue",
						},
					})
				end,
				["volar"] = function()
					-- Directly setup Volar outside mason-lspconfig handlers if issues persist
					lsp_config.volar.setup({
						cmd = { "vue-language-server", "--stdio" },
						filetypes = { "typescript", "javascript", "vue", "json" },
						capabilities = capabilities,
						on_attach = lsp_zero.on_attach,
						init_options = {
							vue = {
								hybridMode = false,
							},
							typescript = {
								tsdk = "/Users/artem/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/tsserverlibrary",
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
									defaultTagNameCase = "both",
									defaultAttrNameCase = "kebabCase",
									getDocumentNameCasesRequest = false,
									getDocumentSelectionRequest = false,
								},
								schemaRequestService = true,
								diagnostics = true,
							},
							documentFeatures = {
								selectionRange = true,
								foldingRange = true,
								linkedEditingRange = true,
								documentSymbol = true,
								documentColor = true,
								documentFormatting = {
									defaultPrintWidth = 100,
								},
							},
						},
					})
				end,
				["clangd"] = function()
					lsp_config.clangd.setup({
						capabilities = capabilities,
						on_attach = lsp_zero.on_attach,
						root_dir = lsp_config.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
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
					lsp_config.lua_ls.setup({
						capabilities = capabilities,
						on_attach = lsp_zero.on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})

		lsp_zero.setup()
		local cmp_action = lsp_zero.cmp_action()
		local ls = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					ls.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
			},
			-- mapping = {
			--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
			--     ['<C-<Tab>>'] = cmp.mapping(function ()
			--         if ls.expandable() then
			--             ls.expand()
			--         elseif cmp.visible() then
			--             cmp.select_next_item()
			--         elseif ls.jumpable(1) then
			--             ls.jump(1)
			--         else
			--             fallback()
			--         end
			--     end, { 'i', 's' }),
			--     ['<Tab>'] = cmp.mapping(function(fallback)
			--     end, { 'i', 's' }),
			--     ['<S-Tab>'] = cmp.mapping(function(fallback)
			--         if ls.jumpable(-1) then
			--             ls.jump(-1)
			--         elseif cmp.visible() then
			--             cmp.select_prev_item()
			--         else
			--             fallback()
			--         end
			--     end, { 'i', 's' })
			-- },
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
