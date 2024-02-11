vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- go next file
vim.keymap.set("n", "gb", "<C-^>")

vim.keymap.set({ "n", "v" }, "<leader>e", "<S-$>")

vim.keymap.set("n", "<leader>rn", ":set rnu!<CR>")

-- windows managing
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])

vim.keymap.set({ "v", "n" }, "<leader>w", "<C-w>")
vim.keymap.set({ "v", "n" }, "<C-w>", "<leader>w")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard config
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix navigation
vim.keymap.set("n", "<C-c>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-x>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>K", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-session<CR>", { silent = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vsr", "<cmd>e ~/.config/nvim/lua/artem-packer/remap.lua<CR>")
vim.keymap.set("n", "<leader>vsp", "<cmd>e ~/.config/nvim/lua/artem-packer/packer.lua<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>jf", vim.cmd.Ex)
