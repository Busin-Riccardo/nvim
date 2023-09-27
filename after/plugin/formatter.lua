require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		javascriptreact = {
			require("formatter.filetypes.javascript").prettierd,
		},
		typescript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.javascript").prettierd,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	desc = "Format on save",
	callback = function()
		vim.cmd.FormatWrite()
	end,
})
