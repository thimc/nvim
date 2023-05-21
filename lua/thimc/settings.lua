vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = true	-- open splits to the right
vim.g.netrw_preview = true -- preview split to the right

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.title = true
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

vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80

-- Change directory to the current file when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function() vim.cmd("silent! lcd %:p:h") end
})

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.api.nvim_win_set_option(0, "number", false)
		vim.api.nvim_win_set_option(0, "relativenumber", false)
		vim.api.nvim_win_set_option(0, "signcolumn", "no")
	end
})

-- Restore cursor position
vim.cmd([[
	autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' &&
	\ line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]])

-- Enable spellcheck for markdown files, git/cvs commits and mails
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown,cvs,gitcommit,mail",
	callback = function() vim.api.nvim_win_set_option(0, "spell", true) end
})
