local telescope = require("telescope.builtin")
local t = require("telescope")

t.setup({
	defaults = {
		mappings = {
			n = {
				["dd"] = require("telescope.actions").delete_buffer,
			},
			i = {
				["<C-h"] = "which_key",
				["<C-d>"] = require("telescope.actions").delete_buffer,
			},
		},
	},
})

t.load_extension("fzf")

vim.keymap.set("n", "<leader>ff", function()
	telescope.find_files({ hidden = true })
end, { desc = "[F]ind [F]iles" })

vim.keymap.set("n", "<leader>fFD", function()
	vim.ui.input({ prompt = "dir:" }, function(dir)
		telescope.find_files({ hidden = true, no_ignore = true, search_dirs = { dir } })
	end)
end, { desc = "[F]ind [F]iles on specific dir" })

vim.keymap.set("n", "<leader>sA", function()
	telescope.live_grep({ search_dirs = { "." } })
end, { desc = "[S]earch [A]ll" })
vim.keymap.set("n", "<leader>sf", telescope.live_grep, { desc = "[S]earch in [F]iles" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "[F]ind [B]uffer" })
vim.keymap.set("n", "<leader>fk", telescope.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>fd", telescope.diagnostics, { desc = "[F]ind [D]iangostics" })
vim.keymap.set("n", "<leader>fc", telescope.treesitter, { desc = "[F]ind [C]ode" })
vim.keymap.set("n", "<leader>fc", telescope.treesitter, { desc = "[F]ind [C]ode" })
