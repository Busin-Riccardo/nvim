require("nvim-tree").setup()

vim.keymap.set("n", "<leader>fe", vim.cmd.NvimTreeFindFileToggle, { desc = "[F]ile [E]xplorer" })
