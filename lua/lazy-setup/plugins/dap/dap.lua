local M = {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_global = require("lazy-setup.configs.dap.dap_global")

		dapui.setup()

		dap_global:config_ui(dap, dapui)
		dap_global:config_keymaps(dap, dapui)
	end,
}

return M
