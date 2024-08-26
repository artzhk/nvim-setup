return {
	"ThePrimeagen/git-worktree.nvim",
	config = function()
		require("telescope").load_extension("git_worktree")
		vim.keymap.set("n", "<leader>gw", "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
		vim.keymap.set(
			"n",
			"<leader>gW",
			"<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>"
		)
	end,
}
