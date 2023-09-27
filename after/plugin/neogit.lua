require("neogit").setup()

vim.keymap.set("n", "<leader>gg", require("neogit").open, { desc = "[G]it [G]raph" })
