vim.opt.relativenumber = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.showmode = true
vim.opt.showcmd = true

vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/backupdir/"
vim.opt.backup = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir/"
vim.opt.undofile = true
vim.g.undolevels = 10000

vim.opt.updatetime = 50
vim.opt.wrap = false
vim.opt.timeoutlen = 300

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- all source code gets wrapped at <80 and auto-indented
vim.cmd([[
" Restore cursor position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Filetype automation
autocmd FileType lua,asm,c,cpp,go,java,javascript,html,make,perl setlocal tw=79 cc=79
autocmd FileType markdown,cvs,gitcommit,mail,eml setlocal tw=79 cc=79 spell
autocmd FileType sh compiler shellcheck

" Add a help button in netrw
autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR>
]])
