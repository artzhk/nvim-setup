vim.opt.guicursor = ""

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.statusline = "%f%M %L, L:%l|C:%c %p%%"
vim.opt.statusline = "%f"

vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.bomb = false

vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true
vim.opt.scrolloff = 10

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.background = "light"
vim.cmd("colorscheme retrobox")

vim.filetype.add({ extension = { ejs = "ejs" } })

vim.api.nvim_create_user_command("Cp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("Bnr", function()
	vim.opt.statusline = "%f"
end, {})

vim.api.nvim_create_user_command("Br", function()
	vim.opt.statusline = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P"
end, {})

-- Copy file name command
vim.api.nvim_create_user_command("Cfn", function()
        local path = vim.fn.expand("%:t")
        path = path:match("^(.+)%..+")
        vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
