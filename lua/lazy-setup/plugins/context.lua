local M = {
	"nvim-treesitter/nvim-treesitter-context",
	as = "treesitter-context",
}

local _setup = {
	enable = true,
	max_lines = 2,
	trim_scope = "outer",
	separator = "-",
}

function M.config()
	local context = require("treesitter-context")
	context.setup(_setup)
end

return M
