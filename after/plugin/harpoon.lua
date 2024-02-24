local harpoon = require("harpoon")

harpoon.setup();

vim.keymap.set("n", "<leader>aa", function()
    harpoon:list():append()
end, { desc = "Harpoon Append" })
vim.keymap.set("n", "<leader>as", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon quick menu" })

vim.keymap.set("n", "<leader>ah", function()
    harpoon:list():select(1)
end, { desc = "Select 1" })
vim.keymap.set("n", "<leader>aj", function()
    harpoon:list():select(2)
end, { desc = "Select 2" })
vim.keymap.set("n", "<leader>ak", function()
    harpoon:list():select(3)
end, { desc = "Select 3" })
vim.keymap.set("n", "<leader>al", function()
    harpoon:list():select(4)
end, { desc = "Select 4" })

vim.keymap.set("n", "<leader>an", function()
    harpoon:list():next()
end, { desc = "Next" })
vim.keymap.set("n", "<leader>ap", function()
    harpoon:list():prev()
end, { desc = "Prev" })