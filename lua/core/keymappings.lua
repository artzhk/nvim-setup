-- just cool
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- LSP bug fix
vim.keymap.set({ 'i', 'n', 'v' }, '<C-C>', '<esc>', { desc = 'Make Ctrl+C behave exactly like escape.' })

-- I would love to find inverse version of this
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- delete all buffers except current
vim.keymap.set("n", "<leader>da", function()
    vim.cmd(":%bd|e#|bd#")
end)

-- beginnging and end of a line
vim.keymap.set({ "n", "v" }, "<leader>e", "<S-$>")

-- enable/disable relative line numbers
vim.keymap.set("n", "<leader>nr", ":set rnu!<CR>")

-- windows managing
vim.keymap.set("n", "=", [[<cmd>vertical resize +10<cr>]])
vim.keymap.set("n", "-", [[<cmd>vertical resize -10<cr>]])
vim.keymap.set("n", "+", [[<cmd>horizontal resize +5<cr>]])
vim.keymap.set("n", "_", [[<cmd>horizontal resize -5<cr>]])

-- windows navigation
-- vim.keymap.set({ "v", "n" }, "<leader>w", "<C-w>")
-- vim.keymap.set({ "v", "n" }, "<C-w>", "<leader>w")
vim.keymap.set({ "v", "n" }, "<leader>wv", ":vsplit<CR><C-w>l")
vim.keymap.set({ "v", "n" }, "<leader>ws", ":split<CR><C-w>j")

-- close all windows but current
vim.keymap.set("n", "<leader>wo", function()
    vim.cmd(":only")
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard config
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Format with current set cmp format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix navigation
vim.keymap.set("n", "<C-x>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-z>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>K", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>lprev<CR>zz")

-- Tmux stuffff
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-session<CR>", { silent = true })

-- Inside of file renaming and making executable
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- quick navigation to remaps
vim.keymap.set("n", "<leader>vsr", "<cmd>e ~/.config/nvim/lua/core/keymappings.lua<CR>")
vim.keymap.set("n", "<leader>vss", "<cmd>e ~/.config/nvim/lua/core/options.lua<CR>")
vim.keymap.set("n", "<leader>vscs", "<cmd>e ~/.config/nvim/lua/lazy-setup/plugins/colorscheme.lua<CR>")

-- pretty clear imho
vim.keymap.set("n", "<leader>jf", vim.cmd.Ex)
