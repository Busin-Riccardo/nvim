require("notify").setup({
	background_colour = "NotifyBackground",
	fps = 5,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
	minimum_width = 20,
	render = "default",
	stages = "static",
	timeout = 5000,
	top_down = true,
})

vim.notify = require("notify")
