require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "lua","vim", "go", "bash", "markdown", "vim" },
	highlight = {
		enable = true,
	},
}
