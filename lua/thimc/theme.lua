vim.o.termguicolors = true

vim.cmd([[colorscheme aurora

highlight clear StatusLine
highlight clear StatusLineNC
highlight clear StatusLineTerm
highlight clear StatusLineTermNC

highlight Normal           guibg=NONE
highlight SignColumn       guibg=NONE
highlight Error            guibg=NONE
highlight ErrorMsg         guibg=NONE
highlight LineNr           guibg=NONE
highlight DiffChange       guibg=NONE
highlight DiffRemoved      guibg=NONE
highlight DiffAdded        guibg=NONE
highlight EndOfBuffer      guibg=NONE
highlight StatusLine       guibg=#22252b guifg=#e6e8ee
highlight StatusLineNC     guibg=#0C0F12 guifg=#e6e8ee
highlight StatusLineTerm   guibg=#0D9C94 guifg=#e6e8ee
highlight StatusLineTermNC guibg=#0D9C94 guifg=#22252b
]])

-- require("tokyonight").setup({
-- 	style = "night",
-- 	transparent = true,
-- 	terminal_colors = true,
-- })
-- vim.cmd([[colorscheme tokyonight-night]])


-- highlight EOL white spaces in INSERT mode
vim.cmd([[
highlight ExtraWhitespace ctermbg=red ctermfg=NONE guibg=#f7768e guifg=NONE
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/
]])
