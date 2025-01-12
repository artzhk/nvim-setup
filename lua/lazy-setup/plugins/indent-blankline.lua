local M = {
	"lukas-reineke/indent-blankline.nvim",
}

M.event = { "BufReadPre", "BufNewFile" }

M.main = "ibl"

M.opts = {
	indent = {
		char = "▏",
	},
	scope = {
		enabled = true,

		highlight = {
			"CursorLineNr",
		},
	},
}

return M
