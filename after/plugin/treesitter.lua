require"nvim-treesitter.configs".setup({
	ensure_installer = { "lua", "javascript", "go", "rust", "help" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true
	}
})
