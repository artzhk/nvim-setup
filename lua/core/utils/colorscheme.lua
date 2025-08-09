M = {}

local function configure_base()
	vim.cmd("hi Cursor guibg=NONE ctermbg=NONE gui=reverse")
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
	vim.cmd("hi clear QuickFixLine ")
	vim.cmd("hi clear Folded")
	vim.cmd("hi clear FoldColumn")
	vim.cmd("hi clear TabLineFill  ")
	vim.cmd("hi clear QuickFixLine ")
	vim.cmd("hi clear MsgSeparator ")
	vim.cmd("hi clear TreesitterContextLineNumber")
	vim.cmd("hi clear MsgSeparator ")
	vim.cmd("hi IncSearch gui=NONE cterm=NONE guibg=#d7474b guifg=#ffffff")
	vim.cmd("hi clear TelescopeMatching")
	vim.cmd("hi link TelescopeMatching IncSearch")
end

local function configure_light()
	vim.cmd("hi clear Cursor")
	vim.cmd("hi Cursor guibg=#000000 guifg=#ffffff")
	vim.cmd("hi clear MatchParen")
	vim.cmd("hi MatchParen cterm=bold gui=bold guibg=none guifg=#d7474b")
	vim.cmd("hi CursorLineNr cterm=bold gui=bold guifg=#d7474b guibg=none")
	vim.cmd("hi CursorLine guibg=#eeeeee")
	vim.cmd("hi Identifier guifg=#2d4f67")
	vim.cmd("hi Delimiter guifg=#545464")
	vim.cmd("hi Special guifg=#6f4c00")
	vim.cmd("hi Type guifg=#5a7785")
	vim.cmd("hi StorageClass guifg=#2d4f67")
	vim.cmd("hi String guifg=#3e612f")
	vim.cmd("hi clear ColorColumn")
	vim.cmd("hi link ColorColumn CursorLine")
	vim.cmd("hi DiagnosticError guifg=#e82424 guibg=none")
	vim.cmd("hi DiagnosticWarn guifg=#e98a00 guibg=none")
	vim.cmd("hi DiagnosticInfo guifg=#5a7785 guibg=none")
	vim.cmd("hi DiagnosticHint guifg=#5e857a guibg=none")
	vim.cmd("hi WarningMsg guifg=#957fb8")
	vim.cmd("hi MiniFilesTitleFocused cterm=bold gui=bold guifg=#545464 guibg=none")
	vim.cmd("hi MiniFilesTitle cterm=bold gui=bold guifg=#766b90 guibg=none")
end

function M.configure()
	configure_base()

	local colorscheme = vim.g.colors_name or "default"
	---@diagnostic disable-next-line: undefined-field
	local bg = vim.opt.background._value or "dark"

	if colorscheme and bg == "light" then
		configure_light()
	end

	if bg == "dark" then
		vim.cmd("hi Normal guibg=#444444 guifg=#ffffff ctermbg=NONE ")
	end
end

return M
