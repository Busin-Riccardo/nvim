return {
	"williamboman/mason.nvim",
	"mbbill/undotree",
	"nvim-lualine/lualine.nvim",
	"lewis6991/gitsigns.nvim",
	"folke/which-key.nvim",
	"Shatur/neovim-session-manager",
	{
		"dmmulroy/tsc.nvim",
		dependencies = {
			"rcarriga/nvim-notify",
		},
	},
	"mfussenegger/nvim-lint",
	"mhartington/formatter.nvim",
	"nvim-tree/nvim-tree.lua",
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			vim.cmd("TSUpdate")
		end,
	},
	"nvim-treesitter/playground",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			--- Uncomment these if you want to manage LSP servers from neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- LSP Support
			"neovim/nvim-lspconfig",
			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
	},
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	"danielo515/nvim-treesitter-reason",
	"nvim-tree/nvim-web-devicons",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"ellisonleao/gruvbox.nvim",
	"jay-babu/mason-nvim-dap.nvim",
	"folke/trouble.nvim",
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"nvim-lua/lsp-status.nvim",
		config = function()
			require("lsp-status").register_progress()
		end,
	},
    {"xiyaowong/transparent.nvim", config = function() require("transparent").setup() end},
}
