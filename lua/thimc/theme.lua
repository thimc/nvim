vim.opt.termguicolors = true -- True color support
vim.o.background = "dark" -- or "light" for light mode

require("tokyonight").setup({
	style = "night",
	transparent = true,
	terminal_colors = true,
})

vim.cmd([[
colorscheme tokyonight-night
highlight LineNrAbove guifg=#3b4261
highlight LineNrBelow guifg=#3b4261
highlight LineNr      guifg=#c0caf5
]])

-- highlight EOL white spaces in INSERT mode
vim.cmd([[
highlight ExtraWhitespace ctermbg=red ctermfg=NONE guibg=red guifg=NONE
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/
]])
