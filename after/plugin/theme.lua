require("gruvbox").setup({
	contrast = "hard",
	transparent_mode = true,
	palette_overrides = {
		gray = "#98971a",
	},
})
vim.cmd("colorscheme gruvbox")

-- highlight EOL whitespaces after leaving INSERT mode
vim.api.nvim_set_hl(0, 'ExtraWhitespace', {bg='#ff5c57', fg='NONE'})
vim.api.nvim_exec(string.format([[match ExtraWhitespace '%s']], [[\s\+\%#\@<!$]]), false)
