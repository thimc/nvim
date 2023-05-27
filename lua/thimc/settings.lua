vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 4
vim.g.netrw_altv = true	-- open splits to the right
vim.g.netrw_preview = true -- preview split to the right

vim.opt.wrap = false
vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/backupdir/"
vim.opt.backup = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir/"
vim.opt.undofile = true
vim.g.undolevels = 10000

vim.opt.timeoutlen = 300
vim.opt.relativenumber = false
vim.opt.signcolumn = "no"

-- -- Change directory to the current file when entering a buffer
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	callback = function()
-- 		vim.cmd("silent! lcd %:p:h")
-- 	end
-- })

-- Remove line numbers and sign column in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.api.nvim_win_set_option(0, "number", false)
		vim.api.nvim_win_set_option(0, "relativenumber", false)
		vim.api.nvim_win_set_option(0, "signcolumn", "no")
	end
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "netrw",
	callback = function()
		vim.api.nvim_win_set_option(0, "colorcolumn", "0")
	end
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local file = vim.fn.expand('%')
		local match = file:match("%.git[\\/\\]COMMIT_EDITMSG$")
		if not match and vim.fn.line("'\"") > 1 and
			vim.fn.line("'\"") <= vim.fn.line("$") then
		  vim.cmd("normal! g`\"")
		end
	end,
})

-- Enable spellcheck for markdown files, git/cvs commits and mails
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown,cvs,gitcommit,mail",
	callback = function()
		vim.api.nvim_win_set_option(0, "spell", true)
		vim.api.nvim_win_set_option(0, "colorcolumn", "80")
	end
})
