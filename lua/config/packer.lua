-- PLUGINS
require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("numToStr/Comment.nvim")
	-- use "aserowy/tmux.nvim"

	use("williamboman/mason.nvim")

	use("folke/flash.nvim")

	use("mbbill/undotree")

	use("nvim-lualine/lualine.nvim")

	use("lewis6991/gitsigns.nvim")

	use("folke/which-key.nvim")

	use("Shatur/neovim-session-manager")

	use({
		"dmmulroy/tsc.nvim",
		requires = {
			"rcarriga/nvim-notify",
		},
	})

	use("mfussenegger/nvim-lint")

	use("mhartington/formatter.nvim")

	use("nvim-tree/nvim-tree.lua")

	use({
		"NeogitOrg/neogit",
		requires = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
	})

	use("nvim-lua/lsp-status.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-treesitter/playground")

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use("github/copilot.vim")

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	use("danielo515/nvim-treesitter-reason")
	use("nvim-tree/nvim-web-devicons")

	-- use({ "romgrk/barbar.nvim", requires = { "nvim-tree/nvim-web-devicons" } })

	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				view_options = {
					-- Show files and directories that start with "."
					show_hidden = true,
				},
			})
		end,
	})

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- THEME

	use({
		"ellisonleao/gruvbox.nvim",
	})
	-- use({
	--     -- Theme inspired by Atom
	--     "navarasu/onedark.nvim",
	--     config = function()
	--         require("onedark").setup({
	--             style = "warmer",
	--         })
	--         require("onedark").load()
	--     end,
	-- })
	--
	use({
		"jay-babu/mason-nvim-dap.nvim",
	})
end)
