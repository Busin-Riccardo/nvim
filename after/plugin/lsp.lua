local lsp_zero = require('lsp-zero')
local lsp = require("lspconfig")

lsp.lua_ls.setup(lsp_zero.nvim_lua_ls())


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction", noremap = true })
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [d]efinition", noremap = true })
  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration", noremap = true })
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "List references", noremap = true })
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[D]iagnostic [N]ext", noremap = true })
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [P]rev", noremap = true })
  vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code Action", noremap = true })
end)
