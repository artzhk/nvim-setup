
local colors = {
  red     = "#9e3039",
  yellow  = "#f4d88c",
  black   = '#1c1d23',
  white   = '#e0e2ea',
  green   = "#aaedb7",
  blue    = "#9fd8ff",
  grey   = "#ebeef5",
  lightgray   = "#d7dae1",
  inactivegrey   = "#c4c6cd",
  darkgray   = "#9b9ea4",
}

local modules_colors = {
    b = {bg = colors.white, fg = colors.darkgray},
    c = {bg = colors.white, fg = colors.gray}
}

local lightLine = {
  normal = {
    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
    b = modules_colors.b,
    c = modules_colors.b
  },
  insert = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = modules_colors.b,
    c = modules_colors.b
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = modules_colors.b,
    c = modules_colors.b
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = modules_colors.b,
    c = modules_colors.b
  },
  command = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = modules_colors.b,
    c = modules_colors.b
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = modules_colors.b,
    c = modules_colors.b
  }
}

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = lightLine,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff",  },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "diagnostics" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
