return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			show_hidden = true,
			lsp_file_methods = {
				timeout_ms = 1000,
				autosave_changes = true,
			},
		})
	end,
}
