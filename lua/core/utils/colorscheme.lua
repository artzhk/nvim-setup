M = {}

local function configure_base()
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	vim.cmd("hi clear SignColumn")
	vim.cmd("hi clear TelescopeBorder")
	vim.cmd("hi clear TelescopeResultsBorder ")
	vim.cmd("hi clear FloatBorder")
	vim.cmd("hi clear NormalFloat")
	vim.cmd("hi clear FloatTitle")
	vim.cmd("hi clear FloatFooter")
	vim.cmd("hi clear Folded")
	vim.cmd("hi clear FoldColumn")
	vim.cmd("hi clear TabLineFill  ")
	vim.cmd("hi clear ColorColumn  ")
	vim.cmd("hi clear QuickFixLine ")
	vim.cmd("hi clear Folded")
	vim.cmd("hi clear FoldColumn")
	vim.cmd("hi clear TabLineFill  ")
	vim.cmd("hi clear ColorColumn  ")
	vim.cmd("hi clear QuickFixLine ")
	vim.cmd("hi clear MsgSeparator ")
	vim.cmd("hi clear TreesitterContextLineNumber")
	vim.cmd("hi clear MsgSeparator ")
	-- vim.cmd("hi clear  LspSignatureActiveParameter")
	-- vim.cmd("hi link LspSignatureActiveParameter WarningMsg ")
	vim.cmd("hi MiniFilesTitleFocused cterm=bold gui=bold guifg=#545464 guibg=none")
	vim.cmd("hi MiniFilesTitle cterm=bold gui=bold guifg=#766b90 guibg=none")
end

function M.configure()
	configure_base()

	---@diagnostic disable-next-line: undefined-field
	if vim.g.colors_name == "retrobox" and vim.opt.background._value == "light" then
		configure_light()
	end
end

return M
