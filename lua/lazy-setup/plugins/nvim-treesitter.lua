local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

local _setup = {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"python",
		"cpp",
		"scss",
		"html",
		"css",
		"typescript",
		"javascript",
		"python",
		"c",
		"lua",
	},
	ignore_install = { "haskell", "jsonc" },
	disable = { "txt" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
	},
}

function M.setup()
        local module = require("nvim-treesitter.configs")
        module.setup(_setup)
end

return M;
