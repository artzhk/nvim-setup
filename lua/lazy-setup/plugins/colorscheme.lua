return {
    "EdenEast/nightfox.nvim",
    config = function()
        local Shade = require("nightfox.lib.shade")

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
            palettes = {
                nightfox = {
                    yellow  = Shade.new("#ebcb8b", "#f0d399", "#d9b263"),
                    cyan    = Shade.new("#88c0d0", "#93ccdc", "#69a7ba"),
                    orange  = Shade.new("#c9826b", "#d89079", "#b46950"),
                    pink    = Shade.new("#bf88bc", "#d092ce", "#a96ca5"),
                }
            },
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
                    StatusLine             = { fg = "#719cd6", bg = "#192330" },
                    FloatBorder            = { fg = "#dbc074" },
                    NormalFloat            = { fg = "#cdcecf", bg = "#192330" },

                    TelescopeBorder        = { fg = "#719cd6" },
                    TelescopePromptBorder  = { fg = "#dbc074" },
                    TelescopePromptPrefix  = { fg = "#dbc074" },
                    TelescopePromptTitle   = { fg = "#dbc074" },
                    TelescopePromptCounter = { fg = "#dbc074" },

                },
            },
        })
        -- setup must be called before loading
        vim.cmd("colorscheme nightfox")
    end
}
