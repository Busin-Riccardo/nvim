require("neogit").setup()

vim.keymap.set("n", "<leader>gg", function()
	require("neogit").open({ kind = "split" })
end, { desc = "[G]it [G]raph" })
