vim.g.mapleader = " "
local bind = vim.keymap.set

-- move text when highlighted
bind("v", "J", "<cmd>m '>+1<CR>gv=gv")
bind("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- J but keep the cursor where it was
bind("n", "J", "mzJ`z")

-- Searching but keep the mouse in the middle of the screen
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

bind("n", "<leader>E", vim.cmd.Ex)
bind("n", "<leader>e", vim.cmd.Lex)
bind("n", "<leader>p", function() require('packer').sync() end)

-- mail signatures
bind('n', '<leader>s', "<cmd>r ~/documents/signature-english.txt<CR>")
bind('n', '<leader>S', "<cmd>r ~/documents/signature-swedish.txt<CR>")

-- spell checks
bind('n', '<leader>se', "<cmd>spell spelllang=en_us<CR>")
bind('n', '<leader>ss', "<cmd>spell spelllang=sv_SE<CR>")

bind('n', '<leader>cc', "<cmd>set tw=80<CR><cmd>set cc=80<CR>")
bind('n', '<leader>ncc', "<cmd>set tw=0<CR><cmd>set cc-=80<CR>")

-- colour higlight
bind('n', '<leader>ch', "<cmd>ColorHighlight<CR>")

-- reload current file
bind('n', '<leader><leader>', "<cmd>so<CR>")

-- write as root
vim.cmd([[ cnoremap w!! execute 'silent! write !doas tee % >/dev/null' ]])

-- Press ? in netrw to get help
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	once = true,
	callback = function()
		vim.keymap.set("n", "?", "<cmd>help netrw-quickmap<CR>")
	end
})

