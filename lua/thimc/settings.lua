
vim.opt.relativenumber = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.shortmess = vim.opt.shortmess + { c = true}
-- vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.showmode = true
vim.opt.showcmd = true

vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.spelllang = { "en" }
vim.opt.spellsuggest = "fast,20"

vim.opt.splitbelow = true -- Put new windows below current
--vim.opt.splitright = true -- Put new windows right of current

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

vim.opt.updatetime = 50 -- Save swap file and trigger CursorHold
vim.opt.wrap = false -- Disable line wrap
vim.opt.timeoutlen = 300

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- all source code gets wrapped at <80 and auto-indented
vim.cmd([[
" Restore cursor position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Set flags for some file types
autocmd FileType lua,asm,c,cpp,go,java,javascript,html,make,perl setlocal fo+=t tw=79 cc=79
autocmd FileType cvs,gitcommit,mail,eml setlocal fo+=t tw=79 spell cc=79
autocmd FileType markdown setlocal fo+=t spell cc=79
autocmd FileType sh compiler shellcheck

" Add a help button in netrw
autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR>
]])
