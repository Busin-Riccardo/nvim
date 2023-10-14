-- KEYMAP

-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xplorer" })
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprev, { desc = "[B]uffer [P]rev" })
vim.keymap.set("n", "<leader>bd", vim.cmd.BufferClose, { desc = "[B]uffer [D]elete" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line" })

-- center found result in the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move window commands under <leader>w
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window" })
