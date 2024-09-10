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

local M = {}

M.eslint_on_save = function(_, buffer)
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = buffer,
		command = "EslintFixAll",
	})
end

return M
