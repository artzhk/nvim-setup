-- return {
--     "folke/tokyonight.nvim",
--     priority = 1000,
--     config = function()
--         local bg = "#011628"
--         local bg_dark = "#011423"
--         local bg_highlight = "#143652"
--         local bg_search = "#0A64AC"
--         local bg_visual = "#275378"
--         local fg = "#CBE0F0"
--         local fg_dark = "#B4D0E9"
--         local fg_gutter = "#627E97"
--         local border = "#547998"

--         require("tokyonight").setup({
--             style = "night",
--             on_colors = function(colors)
--                 colors.bg = nil
--                 colors.bg_dark = bg_dark
--                 colors.bg_float = bg_dark
--                 colors.bg_highlight = bg_highlight
--                 colors.bg_popup = bg_dark
--                 colors.bg_search = bg_search
--                 colors.bg_sidebar = bg_dark
--                 colors.bg_statusline = bg_dark
--                 colors.bg_visual = bg_visual
--                 colors.border = border
--                 colors.fg = fg
--                 colors.fg_dark = fg_dark
--                 colors.fg_float = fg
--                 colors.fg_gutter = fg_gutter
--                 colors.fg_sidebar = fg_dark
--             end
--         })

--         vim.cmd("colorscheme tokyonight")
--     end
-- }

return {
    "EdenEast/nightfox.nvim",
    config = function()
        require('nightfox').setup({
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = false,               -- Disable setting background
                terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false,              -- Non focused panes set to alternative background
                module_default = true,             -- Default enable value for modules
                colorblind = {
                    enable = true,                 -- Enable colorblind support
                    simulate_only = true,          -- Only show simulated colorblind colors and not diff shifted
                    severity = {
                        protan = 0,                -- Severity [0,1] for protan (red)
                        deutan = 0,                -- Severity [0,1] for deutan (green)
                        -- tritan = 1,    -- Severity [0,1] for tritan (blue)
                    },
                },
                styles = {             -- Style to be applied to different syntax groups
                    comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "NONE",
                    keywords = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                    variables = "NONE",
                },
                inverse = { -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = { -- List of various plugins and additional options
                    -- ...
                },
            },
            palettes = {},
            specs = {
                nightfox = {
                    syntax = {
                        -- builtin0 = "orange"
                    },
                    diag = {
                        error = 'red',
                        warn  = 'yellow',
                        info  = 'blue',
                        hint  = 'green',
                        ok    = 'green',
                    }
                }
            },
            groups = {
                nightfox = {
                    StatusLine = { fg = "#719cd6", bg = "#192330" },
                    FloatBorder = { fg = "#dbc074" },
                    NormalFloat     = { fg ="#cdcecf" , bg = "#192330" },

                    TelescopeBorder = { fg = "#719cd6" },
                    TelescopePromptBorder = { fg = "#dbc074" },
                    TelescopePromptPrefix = { fg = "#dbc074" },
                    TelescopePromptTitle = { fg = "#dbc074" },
                    TelescopePromptCounter = { fg = "#dbc074" },

                },
            },
        })
        -- setup must be called before loading
        vim.cmd("colorscheme nightfox")
    end
}

