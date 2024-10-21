local M = {
	"rebelot/kanagawa.nvim",
}

function M:setup()
	return {
		compile = false, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = false },
		functionStyle = {},
		keywordStyle = { bold = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = true, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = { -- add/modify theme and palette colors
			palette = {
				surimiOrange = "#d27e99",
				lotusOrange = "#658594",
				lotusOrange2 = "#223249",
			},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		overrides = function(colors) -- add/modify highlights
			return {}
		end,
		theme = "lotus", -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = "wave", -- try "dragon" !
			light = "lotus",
		},
	}
end

function M:adjust_highlight()
	vim.cmd("hi clear LineNr")
	vim.cmd("hi CursorLineNr cterm=bold gui=bold guifg=#4d699b guibg=none")
	vim.cmd("hi clear CursorLine")
	vim.cmd("hi CursorLine guibg=#c7d7e0 ")
	vim.cmd("hi clear SignColumn")
	vim.cmd("hi clear TelescopeBorder")
	vim.cmd("hi clear TelescopeResultsBorder ")
	vim.cmd("hi clear FloatBorder")
	vim.cmd("hi clear NormalFloat")
	vim.cmd("hi clear FloatTitle")
	vim.cmd("hi clear FloatFooter  ")
	vim.cmd("hi GitSignsStagedAdd guifg=#37482f             guibg=none")
	vim.cmd("hi GitSignsStagedChange guifg=#6f4c00          guibg=none")
	vim.cmd("hi GitSignsStagedDelete guifg=#6b2325          guibg=none")
	vim.cmd("hi GitSignsStagedChangedelete guifg=#6f4c00    guibg=none")
	vim.cmd("hi GitSignsStagedTopdelete guifg=#6b2325       guibg=none")
	vim.cmd("hi GitSignsStagedAddNr guifg=#37482f           guibg=none")
	vim.cmd("hi GitSignsStagedChangeNr guifg=#6f4c00        guibg=none")
	vim.cmd("hi GitSignsStagedDeleteNr guifg=#6b2325        guibg=none")
	vim.cmd("hi GitSignsStagedChangedeleteNr guifg=#6f4c00  guibg=none")
	vim.cmd("hi GitSignsStagedTopdeleteNr guifg=#6b2325     guibg=none")
	vim.cmd("hi GitSignsStagedAddCul guifg=#37482f          guibg=none")
	vim.cmd("hi GitSignsStagedChangeCul guifg=#6f4c00       guibg=none")
	vim.cmd("hi GitSignsStagedDeleteCul guifg=#6b2325       guibg=none")
	vim.cmd("hi GitSignsStagedChangedeleteCul guifg=#6f4c00 guibg=none")
	vim.cmd("hi GitSignsStagedTopdeleteCul guifg=#6b2325    guibg=none")
	vim.cmd("hi GitSignsDelete guifg=#d7474b guibg=none")
	vim.cmd("hi GitSignsChange guifg=#de9800 guibg=none")
	vim.cmd("hi GitSignsAdd    guifg=#6e915f guibg=none")
	vim.cmd("hi clear DiffText")
	vim.cmd("hi DiagnosticSignError guifg=#e82424 guibg=none")
	vim.cmd("hi DiagnosticSignWarn guifg=#e98a00 guibg=none")
	vim.cmd("hi DiagnosticSignInfo guifg=#5a7785 guibg=none")
	vim.cmd("hi DiagnosticSignHint guifg=#5e857a guibg=none")
	vim.cmd("hi WarningMsg guifg=#957fb8")
	vim.cmd("hi clear  LspSignatureActiveParameter")
	vim.cmd("hi link LspSignatureActiveParameter WarningMsg ")
	vim.cmd("hi clear DiagnosticFloatingWarn ")
	vim.cmd("hi clear DiagnosticWarn ")
	vim.cmd("hi clear DiagnosticSignWarn ")
	vim.cmd("hi link DiagnosticFloatingWarn WarningMsg ")
	vim.cmd("hi link DiagnosticWarn WarningMsg ")
	vim.cmd("hi link DiagnosticSignWarn WarningMsg ")

	vim.cmd("hi MiniFilesTitleFocused cterm=bold gui=bold guifg=#545464 guibg=none")
	vim.cmd("hi MiniFilesTitle cterm=bold gui=bold guifg=#766b90 guibg=none")

	vim.cmd("hi clear Folded")
	vim.cmd("hi clear FoldColumn")

	vim.cmd("hi clear TabLineFill  ")
	vim.cmd("hi clear ColorColumn  ")
	vim.cmd("hi clear QuickFixLine ")
	vim.cmd("hi clear MsgSeparator ")

  vim.cmd("hi clear Visual")
  vim.cmd("hi Visual cterm=undercurl gui=undercurl")
end

function M:config()
	require("kanagawa").setup(M:setup())
	vim.cmd("colorscheme kanagawa")
	M:adjust_highlight()
end

return M
