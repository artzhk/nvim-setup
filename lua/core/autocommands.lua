local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     --pattern = { "*.yaml", "*.yml", "*.graphql", "*.html", "*.json", "*.jsx", "*.js", "*.scss", "*.css", "*.ts", "*.vue" },
--     desc = "Auto-format",
--     callback = function()
--         -- local fileName = vim.api.nvim_buf_get_name(0)
--         vim.cmd("<cmd>lua require('conform').format()<CR>")
--     end,
--     group = autocmd_group,
-- })
