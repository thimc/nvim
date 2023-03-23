require("tokyonight").setup({
	style = "night",
	transparent = true,
	terminal_colors = true,
})
vim.cmd([[colorscheme tokyonight-night]])

-- highlight EOL white spaces in INSERT mode
vim.cmd([[
highlight ExtraWhitespace ctermbg=red ctermfg=NONE guibg=#f7768e guifg=NONE
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/
]])
