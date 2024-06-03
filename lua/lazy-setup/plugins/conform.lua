return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			-- format_on_save = function(bufnr)
			-- 	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			-- 		return
			-- 	end
			-- 	return { timeout_ms = 3000, lsp_fallback = true }
			-- end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				vue = { "prettierd" },
				cpp = { "clang-format" },
        go = { "gofmt" },
				-- Use the "*" filetype to run formatters on all filetypes.
				-- ["*"] = { "codespell" },
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
		})
	end,
}
