<<<<<<< HEAD
vim.keymap.set('n', '<leader>r', ":MagmaEvaluateOperator<CR>")
vim.keymap.set('n', '<leader>rr', ':MagmaEvaluateLine<CR>')
vim.keymap.set('x', '<leader>r', ':<C-u>MagmaEvaluateVisual<CR>')
vim.keymap.set('n', '<leader>rc', ':MagmaReevaluateCell<CR>')
vim.keymap.set('n', '<leader>rd', ':MagmaDelete<CR>')
vim.keymap.set('n', '<leader>ro', ':MagmaShowOutput<CR>')

vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "ueberzug"
=======
-- Key mappings
vim.keymap.set('n', '<leader>e', ':MagmaEvaluateOperator<CR>', { silent = true, expr = true })
vim.keymap.set('n', '<leader>ee', ':MagmaEvaluateLine<CR>', { silent = true })
vim.keymap.set('x', '<leader>e', ':<C-u>MagmaEvaluateVisual<CR>', { silent = true })
vim.keymap.set('n', '<leader>ec', ':MagmaReevaluateCell<CR>', { silent = true })
vim.keymap.set('n', '<leader>ed', ':MagmaDelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>eo', ':MagmaShowOutput<CR>', { silent = true })
vim.keymap.set('n', '<leader>mi', ':MagmaInit<CR>', { silent = true })

-- Settings
vim.g.magma_automatically_open_output = true
vim.g.magma_image_provider = 'kitty'
>>>>>>> main

