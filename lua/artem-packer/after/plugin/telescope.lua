local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        file_ignore_patterns = { "node_modules", ".git", "lib/*", "assets/*" },
        mappings = {
            i = {
                ["<C-c>"] = { "<esc>", type = "command" },
                ["<esc>"] = actions.close,
                ["<C-o>"] = action_layout.toggle_preview,
                ["<C-r>"] = actions.delete_buffer,
            },
            n = {
                ["<C-r>"] = actions.delete_buffer,
                ["<C-o>"] = action_layout.toggle_preview,
                ["q"] = actions.close,
            },
        },
    },
})

-- View current buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- Files search
vim.keymap.set('n', '<leader>fj', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- File search relative to current file's directory
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

-- Grep relative to opened project directory
vim.keymap.set('n', '<leader>mg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Grep relative to current file's directory
vim.keymap.set('n', '<leader>rdf', function()
    builtin.grep_string({ search = vim.fn.input("Relative Grep > "), cwd = utils.buffer_dir() })
end)

vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
