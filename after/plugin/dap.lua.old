require("dap-go").setup()
require("dapui").setup()

local dap = require("dap")

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9003,
		localSourceRoot = "${workspaceRoot}",
	},
}
