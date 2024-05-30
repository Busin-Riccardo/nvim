require("neodev").setup({})

local lsp_zero = require("lsp-zero")
local lsp = require("lspconfig")
local util = require("lspconfig.util")

lsp.lua_ls.setup(lsp_zero.nvim_lua_ls())

require("mason").setup({})

-- for debugging gleam lsp
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*.gleam",
	callback = function()
		require("vim.lsp.log").set_level("debug")
	end,
})

require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
		elixirls = function()
			require("lspconfig").elixirls.setup({
				cmd = { "/Users/riccardo/.local/share/nvim/mason/bin/elixir-ls" },
				filetypes = { "elixir", "eelixir" },
				root_dir = lsp.util.root_pattern("mix.exs", ".git"),
			})
		end,
		ocamllsp = function()
			require("lspconfig").ocamllsp.setup({
				cmd = { "ocamllsp" },
				filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
				root_dir = lsp.util.root_pattern(
					"*.opam",
					"esy.json",
					"package.json",
					".git",
					"dune-project",
					"dune-workspace"
				),
			})
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
		html = function()
			require("lspconfig").html.setup({
				filetypes = { "html", "template", "heex" },
			})
		end,
		tailwindcss = function()
			-- adds support for .ml files with tyxml
			require("lspconfig").tailwindcss.setup({
				filetypes = {
					-- html
					"gotmpl",
					"aspnetcorerazor",
					"astro",
					"astro-markdown",
					"blade",
					"clojure",
					"django-html",
					"htmldjango",
					"edge",
					"eelixir", -- vim ft
					"elixir",
					"ejs",
					"erb",
					"eruby", -- vim ft
					"gohtml",
					"haml",
					"handlebars",
					"hbs",
					"html",
					-- 'HTML (Eex)',
					-- 'HTML (EEx)',
					"html-eex",
					"heex",
					"jade",
					"leaf",
					"liquid",
					"markdown",
					"mdx",
					"mustache",
					"njk",
					"nunjucks",
					"php",
					"razor",
					"slim",
					"twig",
					"templ",
					"template",
					-- css
					"css",
					"less",
					"postcss",
					"sass",
					"scss",
					"stylus",
					"sugarss",
					-- js
					"javascript",
					"javascriptreact",
					"reason",
					"rescript",
					"typescript",
					"typescriptreact",
					-- mixed
					"vue",
					"svelte",
					-- my custom
					"ocaml",
				},
				init_options = {
					userLanguages = {
						eelixir = "html-eex",
						heex = "html",
						eruby = "erb",
						ocaml = "html",
						template = "html",
						gotmpl = "html",
					},
				},
				experimental = {
					classRegex = {
						[[class="([^"]*)]],
						'class=\\s+"([^"]*)',
						-- regex for tyxml a_class ["class"]
						'a_class\\s+\\[\\s+"([^"]*)',
					},
				},
				settings = {
					tailwindCSS = {
						validate = true,
						lint = {
							cssConflict = "warning",
							invalidApply = "error",
							invalidScreen = "error",
							invalidVariant = "error",
							invalidConfigPath = "error",
							invalidTailwindDirective = "error",
							recommendedVariantOrder = "warning",
						},
						classAttributes = {
							"class",
							"className",
							"class:list",
							"classList",
							"ngClass",
							"a_class",
						},
					},
				},
				on_new_config = function(new_config)
					if not new_config.settings then
						new_config.settings = {}
					end
					if not new_config.settings.editor then
						new_config.settings.editor = {}
					end
					if not new_config.settings.editor.tabSize then
						-- set tab size for hover
						new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
					end
				end,
				root_dir = function(fname)
					return util.root_pattern(
						"tailwind.config.js",
						"assets/tailwind.config.js",
						"tailwind.config.cjs",
						"tailwind.config.mjs",
						"tailwind.config.ts"
					)(fname) or util.root_pattern(
						"postcss.config.js",
						"postcss.config.cjs",
						"postcss.config.mjs",
						"postcss.config.ts"
					)(fname) or util.find_package_json_ancestor(fname) or util.find_node_modules_ancestor(fname) or util.find_git_ancestor(
						fname
					)
				end,
				docs = {
					description = [[
https://github.com/tailwindlabs/tailwindcss-intellisense

Tailwind CSS Language Server can be installed via npm:
```sh
npm install -g @tailwindcss/language-server
```
]],
					default_config = {
						root_dir = [[root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts', 'package.json', 'node_modules', '.git')]],
					},
				},
			})
		end,
	},
})
require("mason-nvim-dap").setup({ ensure_installed = { "php" } })

-- vim.lsp.set_log_level 'debug'
--
-- vim.filetype.add({ extension = { templ = "templ" } })
require("lsp-status").register_progress()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	require("lsp-status").on_attach(client)
	local telescope = require("telescope.builtin")
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction", noremap = true })
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [d]efinition", noremap = true })
	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration", noremap = true })
	-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "List references", noremap = true })
	vim.keymap.set("n", "<leader>gr", telescope.lsp_references, { desc = "List references", noremap = true })
	vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, { desc = "[D]iagnostic [S]how", noremap = true })
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[D]iagnostic [N]ext", noremap = true })
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [P]rev", noremap = true })
	-- vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code Action", noremap = true })
end)

-- lsp.templ.setup({
--     cmd = { "templ", "lsp", "-http=localhost:7474", "-log=/Users/riccardo/templ.log" },
--     filetypes = { "templ" },
--     root_dir = lsp.util.root_pattern("go.mod", ".git"),
--     settings = {},
-- })

lsp.html.setup({
	filetypes = { "html", "template" },
})

lsp.gopls.setup({
	filetypes = { "go", "template" },
})

lsp.htmx.setup({
	filetypes = { "html", "template" },
})

lsp.gleam.setup({
	cmd = { "/Users/riccardo/progetti/pers/gleam/target/release/gleam", "lsp" },
	filetypes = { "gleam" },
	root_dir = lsp.util.root_pattern("gleam.toml", ".git"),
})

lsp.tsserver.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
})

lsp.eslint.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = true
		client.server_capabilities.documentFormattingRangeProvider = true
	end,
})

-- lsp.yamlls.setup({
-- })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	desc = "Lsp format on save",
	callback = function()
		if vim.bo.filetype == "template" then
			return
		end
		vim.lsp.buf.format({
			filter = function(client)
				return client.name ~= "tsserver" and client.name ~= "volar"
			end,
		})
	end,
})
