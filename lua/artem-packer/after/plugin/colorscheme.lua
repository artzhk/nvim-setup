require('kanagawa').setup({
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    background = {
        dark = "dragon", -- wave, dragon, lotus
        light = "lotus"
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
})

--local path = vim.o.background
--print(path);
vim.cmd('colorscheme kanagawa')
print(vim.o.background);
