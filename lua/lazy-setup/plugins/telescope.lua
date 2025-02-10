return {
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local utils = require("telescope.utils")
			local actions = require("telescope.actions")
			local action_layout = require("telescope.actions.layout")

			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							preview_height = 0.7,
							width = 0.9,
							horizontal = 0.9,
							prompt_position = "top",
						},
					},
					sorting_strategy = "ascending",
					color_devicons = true,
					file_ignore_patterns = {
						"node_modules",
						".git$", --[[ "lib/*" ]] --[[ "assets/*" ]]
					},
					mappings = {
						i = {
							["<C-p>"] = action_layout.toggle_preview,
							["<C-o>"] = function(p_bufnr)
								actions.send_selected_to_qflist(p_bufnr)
								vim.cmd.cfdo("edit")
							end,
							["<C-r>"] = actions.delete_buffer,
							["<C-q>"] = function(p_bufnr)
								actions.send_to_qflist(p_bufnr)
								actions.open_qflist(p_bufnr)
							end,
						},
						n = {
							["<C-o>"] = function(p_bufnr)
								actions.send_selected_to_qflist(p_bufnr)
								vim.cmd.cfdo("edit")
							end,
							["<C-r>"] = actions.delete_buffer,
							["<C-p>"] = action_layout.toggle_preview,
						},
					},
				},
			})

			-- View current buffers
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

			-- -- Files search
			vim.keymap.set("n", "<leader>du", builtin.find_files, {})

			-- Files search Dvorak
			-- vim.keymap.set("n", "<leader>hu", builtin.find_files, {})

			vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})

			-- File search relative to current file's directory
			vim.keymap.set("n", "<leader>df", function()
				builtin.find_files({ cwd = utils.buffer_dir() })
			end, {})

			vim.keymap.set("n", "<leader>gs", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>tq", function()
				builtin.quickfix()
			end)

			vim.keymap.set("n", "<leader>gS", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)

			-- Grep relative to opened project directory
			vim.keymap.set("n", "<leader>mg", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)

			-- Grep relative to current file's directory
			vim.keymap.set("n", "<leader>rg", function()
				builtin.grep_string({ search = vim.fn.input("Relative Grep > "), cwd = utils.buffer_dir() })
			end)

			vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
