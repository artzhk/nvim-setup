local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set('n', '<leader>fj', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>df', function()
    builtin.find_files({ cwd = utils.buffer_dir() })
end, {})

vim.keymap.set('n', '<leader>gs', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)

vim.keymap.set('n', '<leader>gS', function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end)

vim.keymap.set('n', '<leader>mg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
