local signs = require("gitsigns")
signs.setup()

vim.keymap.set("n", "<leader>go", signs.diffthis, { desc = "[G]it Show diff" })
vim.keymap.set("n", "<leader>gb", signs.toggle_current_line_blame, { desc = "[G]it Show diff" })
