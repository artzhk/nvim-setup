local M = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

local function get_prev()
	vim.diagnostic.jump({ count = -1, float = true })
	-- vim.diagnostic.goto_prev()
end

local function get_next()
	vim.diagnostic.jump({ count = 1, float = true })
	-- vim.diagnostic.goto_next()
end

function M.init(lsp_zero, cmp_lsp, lsp_config)
	M.lsp_zero = lsp_zero
	M.cmp_lsp = cmp_lsp
	M.lsp_config = lsp_config
end

function M.capabilities()
	return vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		M.cmp_lsp.default_capabilities()
	)
end

function M.on_attach(client, bufnr)
	client.server_capabilities.semanticTokensprovider = nil
	M.config_keymaps(client, bufnr)
end

function M.config_keymaps(client, bufnr)
	M.lsp_zero.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr, remap = true }

	--        -- Diagnistics quickfixlist current buffer
	-- vim.keymap.set("n", "<leader>dq", function()
	-- 	vim.diagnostic.setqflist({ bufnr = 0, severity = "ERROR" })
	-- end, opts)

	-- Diagnistics quickfixlist current buffer
	vim.keymap.set("n", "<leader>dq", function()
		vim.diagnostic.setqflist({ namespace = 0, open = true, severity = "ERROR" })
	end, opts)

	-- Diagnistics quickfixlist all buffers
	vim.keymap.set("n", "<leader>dQ", function()
		vim.diagnostic.setqflist({ severity = "ERROR" })
	end, opts)

	if client.name == "omnisharp" or client.name == "cs" then
		vim.keymap.set("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definitions()<cr>", opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol(vim.fn.input("Grep > "))
		end, opts)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
		vim.keymap.set("n", "]e", get_next)
		vim.keymap.set("n", "[e", get_prev)
		vim.keymap.set("n", "<leader>va", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", "<cmd>lua require('omnisharp_extended').lsp_references()<cr>", opts)
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "<leader>vi", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>", opts)
		vim.keymap.set("n", "<leader>vt", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>", opts)

		return
	end

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "single" })
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol(vim.fn.input("Grep > "))
	end, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
	vim.keymap.set("n", "]e", get_next)
	vim.keymap.set("n", "[e", get_prev)
	vim.keymap.set("n", "<leader>va", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-g>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

function M.setup_snippet_source(name)
	return {
		name = name,
		entry_filter = function(entry, _)
			return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
		end,
	}
end

return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		{ "williamboman/mason.nvim" },

		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		-- LSP Support
		{ "neovim/nvim-lspconfig" },

		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{ "saadparwaiz1/cmp_luasnip" },
				{
					"L3MON4D3/LuaSnip",
				},
				{ "rafamadriz/friendly-snippets" },
			},
		},

		{ "pmizio/typescript-tools.nvim" },

		-- C# Support
		{ "Hoffs/omnisharp-extended-lsp.nvim" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local lsp_config = require("lspconfig")

		M.init(lsp_zero, cmp_lsp, lsp_config)
		M.lsp_zero.extend_lspconfig()
		M.lsp_zero.on_attach(M.on_attach)

		vim.filetype.add({ extension = { ejs = "ejs" } })
		local pyright_config = require("lazy-setup.configs.ls.pyright")
		local tsserver_config = require("lazy-setup.configs.ls.tsserver")
		local volar_config = require("lazy-setup.configs.ls.volar")

		require("mason").setup(M.ui)

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "ts_ls", "clangd" },
			handlers = {
				M.lsp_zero.default_setup,
				function(server)
					lsp_config[server].setup({
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
					})
				end,
				["omnisharp"] = function()
					require("omnisharp_extended").lsp_definitions()
					lsp_config.omnisharp.setup({
						cmd = { "dotnet", "/home/art/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
					})
				end,
				["eslint"] = function()
					lsp_config.eslint.setup({
						capabilities = M.capabilities(),
						settings = {
							workingDirectories = { mode = "location" },
						},
					})
				end,
				["pyright"] = function()
					lsp_config.pyright.setup({
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
						default_config = pyright_config.default_config,
						commands = pyright_config.commands,
					})
				end,
				["ts_ls"] = function()
					lsp_config.ts_ls.setup({
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
						init_options = tsserver_config.init_options(false),
						filetypes = tsserver_config.filetypes,
					})
				end,
				["volar"] = function()
					-- Directly setup Volar outside mason-lspconfig handlers if issues persist
					lsp_config.volar.setup({
						cmd = volar_config.cmd,
						filetypes = volar_config.filetypes,
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
						init_options = volar_config.init_options,
					})
				end,
				["clangd"] = function()
					lsp_config.clangd.setup({
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
						root_dir = lsp_config.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
					})
				end,
				["html"] = function()
					lsp_config.html.setup({
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
						filetypes = { "html", "ejs" },
					})
				end,
				["angularls"] = function()
					lsp_config.angularls.setup({
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
						root_dir = lsp_config.util.root_pattern("angular.json", "package.json"),
					})
				end,
				["lua_ls"] = function()
					local lua_opts = M.lsp_zero.nvim_lua_ls()
					lsp_config.lua_ls.setup({
						capabilities = M.capabilities(),
						on_attach = M.lsp_zero.on_attach,
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

		-- TODO: refactor this to a separate module
		M.lsp_zero.setup()
		local cmp_action = M.lsp_zero.cmp_action()
		local ls = require("luasnip")
		local vs_code_snip = require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					if vs_code_snip ~= nil then
						vs_code_snip.expand_or_jump(args.body)
					else
						ls.lsp_expand(args.body)
					end
					-- vim.snippet.expand(args.body)
				end,
			},
			sources = {
				M.setup_snippet_source("luasnip"),
				M.setup_snippet_source("nvim_lsp"),
				M.setup_snippet_source("nvim_lua"),
				M.setup_snippet_source("buffer"),
				M.setup_snippet_source("path"),
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping.scroll_docs(5),
				["<C-k>"] = cmp.mapping.scroll_docs(-5),
				["<C-e>"] = cmp.mapping.abort(),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
				{ name = "path" },
			},
		})
	end,
}
