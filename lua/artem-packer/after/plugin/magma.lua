-- Key mappings
vim.keymap.set('n', '<leader>e', ':MagmaEvaluateOperator<CR>', { silent = true, expr = true })
vim.keymap.set('n', '<leader>ee', ':MagmaEvaluateLine<CR>', { silent = true })
vim.keymap.set('x', '<leader>e', ':<C-u>MagmaEvaluateVisual<CR>', { silent = true })
vim.keymap.set('n', '<leader>ec', ':MagmaReevaluateCell<CR>', { silent = true })
vim.keymap.set('n', '<leader>ed', ':MagmaDelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>eo', ':MagmaShowOutput<CR>', { silent = true })

-- Settings
vim.g.magma_automatically_open_output = true

