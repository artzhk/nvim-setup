local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })
local gitlens = require("core.utils.gitlens")

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	pattern = "*",
	desc = "Clear blame virt text",
	callback = function()
		gitlens.clearBlameVirtText()
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function(_)
		vim.cmd("hi clear  NormalFloat")
		vim.cmd("hi link NormalFloat  NormalNC")
		vim.cmd("hi clear FloatBorder")
		vim.cmd("hi link FloatBorder  NormalNC")
		vim.cmd("hi clear DiagnosticUnderlineError")
		vim.cmd("hi clear DiagnosticUnderlineHint")
		vim.cmd("hi clear DiagnosticUnderlineInfo")
		vim.cmd("hi clear DiagnosticUnderlineOk")
		vim.cmd("hi clear DiagnosticUnderlineWarn")
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	desc = "Remove bomb if presented",
	callback = function()
		-- leverage not deprecated version
		local is_bomb = vim.api.nvim_exec("setlocal bomb?", true)
		print(is_bomb)
		if string.match(is_bomb, "nobomb") then
			return
		end

		vim.cmd("setlocal nobomb")
	end,
})

local M = {}

M.eslint_on_save = function(_, buffer)
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = buffer,
		command = "EslintFixAll",
	})
end

return M
