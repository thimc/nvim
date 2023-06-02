require("gruvbox").setup({
	contrast = "hard",
	transparent_mode = true,
	palette_overrides = {
		gray = "#31b72c",
	},
})
vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_hl(0, 'ExtraWhitespace', {bg='#ff5c57', fg='NONE'})
vim.api.nvim_exec(string.format([[match ExtraWhitespace '%s']], [[\s\+\%#\@<!$]]), false)
