local M = {}

-- function M:init(lsp_zero, cmp_lsp)
-- 	M.lsp_zero = lsp_zero
-- 	M.cmp_lsp = cmp_lsp
-- end

function M:config_keymaps(client, bufnr, opts)
	if client.name == "omnisharp" or client.name == "cs" then

		vim.keymap.set("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definitions()<cr>", opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol(vim.fn.input("Grep > "))
		end, opts)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
		vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
		vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "<leader>va", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", "<cmd>lua require('omnisharp_extended').lsp_references()<cr>", opts)
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "<leader>vi", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>", opts)
		vim.keymap.set("n", "<leader>vt", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>", opts)

		return
	end

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol(vim.fn.input("Grep > "))
	end, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
	vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
	vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<leader>va", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

return M
