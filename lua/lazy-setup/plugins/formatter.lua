return {
    'mhartington/formatter.nvim',
    config = function()
        local prettier_config = function()
            return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true
            }
        end

        require('formatter').setup({
            logging = false,
            filetype = {
                javascript = {
                    prettier_config
                },
                typescript = {
                    prettier_config
                },
                vue = {
                    prettier_config
                },
                html = {
                    prettier_config
                },
                -- other formatters ...
            }
        })
    end
}
