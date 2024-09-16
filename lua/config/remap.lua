local function with_count(fn)
	return function()
		if vim.v.count > 0 then
			for i = 1, vim.v.count do
				fn()
			end
		else
			fn()
		end
	end
end

-- KEYMAP

-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xplorer" })
vim.keymap.set("n", "<leader>bn", with_count(vim.cmd.bn), { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", with_count(vim.cmd.bp), { desc = "[B]uffer [P]rev" })
vim.keymap.set("n", "<leader>bd", vim.cmd.bd, { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bDD", function()
	vim.cmd("%bd|e#")
end, { desc = "Close all buffers except current" })
vim.keymap.set("n", "<leader>bP", vim.cmd.BufferPick, { desc = "[B]uffer [P]ick" })
vim.keymap.set("n", "<leader>bmn", with_count(vim.cmd.BufferMoveNext), { desc = "[B]uffer [M]ove [N]ext" })
vim.keymap.set("n", "<leader>bmp", with_count(vim.cmd.BufferMovePrevious), { desc = "[B]uffer [M]ove [P]revious" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line" })

-- center found result in the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move window commands under <leader>w
-- vim.keymap.set("n", "<leader>wn", "<C-w>", { desc = "Window" })

vim.keymap.set("n", "<leader>wn", function()
	local buf = vim.api.nvim_get_current_buf()
	vim.cmd.vsplit()
	vim.api.nvim_win_set_buf(0, buf)
end, { desc = "New Window" })

vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window" })

vim.keymap.set("n", "<leader>f.", vim.cmd.Oil, { desc = "Oil" })
vim.api.nvim_set_keymap("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })

-- DAP

vim.keymap.set("n", "<leader>da", vim.cmd.DapToggleBreakpoint, { desc = "Add breakpoint" })
vim.keymap.set("n", "<leader>do", function()
	require("dapui").toggle()
	-- local widgets = require("dap.ui.widgets")
	-- local sidebar = widgets.sidebar(widgets.scopes)
	-- sidebar.open()
end, { desc = "Open DAP sidebar" })

vim.keymap.set("n", "<leader>Gt", vim.cmd.GoTestFile, { desc = "Go test" })
vim.keymap.set("n", "<leader>Gmt", vim.cmd.GoTestFile, { desc = "Go test module" })

vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Debug continue" })
vim.keymap.set("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end, { desc = "Debug go test" })
vim.keymap.set("n", "<leader>dgl", function()
	require("dap-go").debug_last_test()
end, { desc = "Debug last go test" })
vim.keymap.set("n", "<leader>dK", function()
	require("dapui").eval()
end, { desc = "Debug step over" })
vim.keymap.set("n", "<leader>dj", function()
	require("dap").step_over()
end, { desc = "Debug step over" })
vim.keymap.set("n", "<leader>dk", function()
	require("dap").step_out()
end, { desc = "Debug step out" })
vim.keymap.set("n", "<leader>dh", function()
	require("dap").step_into()
end, { desc = "Debug step into" })
vim.keymap.set("n", "<leader>dS", function()
	require("dap").stop()
end, { desc = "Debug stop" })

-- TABS
vim.keymap.set("n", "<leader>tN", vim.cmd.tabnew, { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, { desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext, { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprevious, { desc = "Previous tab" })
