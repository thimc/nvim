vim.o.termguicolors = true

local ok, colorbuddy = pcall(require, 'colorbuddy')
if ok then
	vim.g.snazzybuddy_italics = false
	colorbuddy.colorscheme('snazzybuddy')
	vim.cmd([[
	highlight Normal        guibg=NONE
	highlight SignColumn    guibg=NONE
	highlight ColorColumn   guibg=#181818
	highlight PmenuSel      guibg=#333333
	highlight StatusLine    guibg=#181818 guifg=#ff9f43
	highlight StatusLineNC  guibg=#181818 guifg=#b8b8b9
	]])
end

-- highlight EOL white spaces after leaving INSERT mode
vim.cmd([[
highlight ExtraWhitespace ctermbg=red ctermfg=NONE guibg=#ff5c57 guifg=NONE
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/
]])
