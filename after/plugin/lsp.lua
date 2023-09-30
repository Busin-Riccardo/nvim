local lsp_zero = require("lsp-zero")
local lsp = require("lspconfig")

lsp.lua_ls.setup(lsp_zero.nvim_lua_ls())

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
		ocamllsp = function()
			require("lspconfig").ocamllsp.setup({})
		end,
		graphql = function()
			require("lspconfig").graphql.setup({
				filetypes = { "graphql", "typescript", "typescriptreact", "javascript", "javascriptreact" },
				root_dir = require("lspconfig").util.root_pattern(
					".git",
					".graphqlrc",
					".graphqlrc.json",
					"package.json",
					"graphql.config.yml"
				),
			})
		end,
	},
})

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	require("lsp-status").on_attach(client)
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction", noremap = true })
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [d]efinition", noremap = true })
	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration", noremap = true })
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "List references", noremap = true })
	vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, { desc = "[D]iagnostic [S]how", noremap = true })
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[D]iagnostic [N]ext", noremap = true })
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [P]rev", noremap = true })
	vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code Action", noremap = true })
end)

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	desc = "Lsp format on save",
	callback = vim.lsp.buf.format,
})
