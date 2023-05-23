require("gruvbox").setup({
	contrast = "hard",
	transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")

-- highlight EOL whitespaces after leaving INSERT mode
vim.cmd([[
highlight ExtraWhitespace ctermbg=red ctermfg=NONE guibg=#ff5c57 guifg=NONE
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/
]])
