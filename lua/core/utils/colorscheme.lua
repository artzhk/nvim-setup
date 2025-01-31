M = {}

local function configure_base()
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	vim.cmd("hi clear  NormalFloat")
	vim.cmd("hi link NormalFloat  NormalNC")
	vim.cmd("hi clear FloatBorder")
	vim.cmd("hi link FloatBorder  NormalNC")
	-- vim.cmd("hi clear DiagnosticUnderlineError")
	-- vim.cmd("hi clear DiagnosticUnderlineHint")
	-- vim.cmd("hi clear DiagnosticUnderlineInfo")
	-- vim.cmd("hi clear DiagnosticUnderlineOk")
	-- vim.cmd("hi clear DiagnosticUnderlineWarn")
end

local function configure_light()
	vim.cmd("hi clear MatchParen")
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	vim.cmd("hi MatchParen cterm=bold gui=bold guibg=#ffffff guifg=#d27e99")
	vim.cmd("hi IncSearch cterm=bold gui=bold guibg=#d7474b guifg=#ffffff")
	vim.cmd("hi clear LineNr")
	vim.cmd("hi CursorLineNr cterm=bold gui=bold guifg=#d7474b guibg=none")
	vim.cmd("hi clear TelescopeMatching")
	vim.cmd("hi TelescopeMatching guibg=#d7474b guifg=#ffffff")
	vim.cmd("hi clear CursorLine")
	vim.cmd("hi CursorLine guibg=#eeeeee")
	vim.cmd("hi clear Identifier")
	vim.cmd("hi Identifier guifg=#2d4f67")
	vim.cmd("hi clear Delimiter")
	vim.cmd("hi Delimiter guifg=#545464")
	vim.cmd("hi clear Special")
	vim.cmd("hi Special guifg=#6f4c00")
	vim.cmd("hi clear Type")
	vim.cmd("hi Type guifg=#5a7785")
	vim.cmd("hi clear SignColumn")
	vim.cmd("hi clear TelescopeBorder")
	vim.cmd("hi clear TelescopeResultsBorder ")
	vim.cmd("hi clear FloatBorder")
	vim.cmd("hi clear NormalFloat")
	vim.cmd("hi clear FloatTitle")
	vim.cmd("hi clear FloatFooter")
	-- vim.cmd("hi GitSignsStagedAdd guifg=#37482f             guibg=none")
	-- vim.cmd("hi GitSignsStagedChange guifg=#6f4c00          guibg=none")
	-- vim.cmd("hi GitSignsStagedDelete guifg=#6b2325          guibg=none")
	-- vim.cmd("hi GitSignsStagedChangedelete guifg=#6f4c00    guibg=none")
	-- vim.cmd("hi GitSignsStagedTopdelete guifg=#6b2325       guibg=none")
	-- vim.cmd("hi GitSignsStagedAddNr guifg=#37482f           guibg=none")
	-- vim.cmd("hi GitSignsStagedChangeNr guifg=#6f4c00        guibg=none")
	-- vim.cmd("hi GitSignsStagedDeleteNr guifg=#6b2325        guibg=none")
	-- vim.cmd("hi GitSignsStagedChangedeleteNr guifg=#6f4c00  guibg=none")
	-- vim.cmd("hi GitSignsStagedTopdeleteNr guifg=#6b2325     guibg=none")
	-- vim.cmd("hi GitSignsStagedAddCul guifg=#37482f          guibg=none")
	-- vim.cmd("hi GitSignsStagedChangeCul guifg=#6f4c00       guibg=none")
	-- vim.cmd("hi GitSignsStagedDeleteCul guifg=#6b2325       guibg=none")
	-- vim.cmd("hi GitSignsStagedChangedeleteCul guifg=#6f4c00 guibg=none")
	-- vim.cmd("hi GitSignsStagedTopdeleteCul guifg=#6b2325    guibg=none")
	-- vim.cmd("hi GitSignsDelete guifg=#d7474b guibg=none")
	-- vim.cmd("hi GitSignsChange guifg=#de9800 guibg=none")
	-- vim.cmd("hi GitSignsAdd    guifg=#6e915f guibg=none")
	-- vim.cmd("hi clear DiffText")
	vim.cmd("hi DiagnosticError guifg=#e82424 guibg=none")
	vim.cmd("hi DiagnosticWarn guifg=#e98a00 guibg=none")
	vim.cmd("hi DiagnosticInfo guifg=#5a7785 guibg=none")
	vim.cmd("hi DiagnosticHint guifg=#5e857a guibg=none")
	vim.cmd("hi WarningMsg guifg=#957fb8")
	vim.cmd("hi clear  LspSignatureActiveParameter")
	vim.cmd("hi link LspSignatureActiveParameter WarningMsg ")
	-- vim.cmd("hi clear DiagnosticFloatingWarn ")
	-- vim.cmd("hi clear DiagnosticWarn ")
	-- vim.cmd("hi clear DiagnosticSignWarn ")
	-- vim.cmd("hi link DiagnosticFloatingWarn WarningMsg ")
	-- vim.cmd("hi link DiagnosticWarn WarningMsg ")
	-- vim.cmd("hi link DiagnosticSignWarn WarningMsg ")
	vim.cmd("hi MiniFilesTitleFocused cterm=bold gui=bold guifg=#545464 guibg=none")
	vim.cmd("hi MiniFilesTitle cterm=bold gui=bold guifg=#766b90 guibg=none")
	vim.cmd("hi clear Folded")
	vim.cmd("hi clear FoldColumn")
	vim.cmd("hi clear TabLineFill  ")
	vim.cmd("hi clear ColorColumn  ")
	vim.cmd("hi clear QuickFixLine ")
	vim.cmd("hi clear MsgSeparator ")
	vim.cmd("hi clear TreesitterContextLineNumber")
end

function M.configure()
	if vim.g.colors_name == "retrobox" then
		configure_light()
	else
		configure_base()
	end
end

return M
