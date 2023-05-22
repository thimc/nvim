vim.g.mapleader = " "
local bind = vim.keymap.set

-- move text when highlighted
bind("v", "J", "<cmd>m '>+1<CR>gv=gv")
bind("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- J but keep the cursor where it was
bind("n", "J", "mzJ`z")

-- split window and set focus
bind("n", "<leader>v", "<C-w>v<C-w>l")

-- Tree explorer, basically nvimtree
bind("n", "<leader>x", vim.cmd.Lex)
bind("n", "<leader>X", vim.cmd.Ex)

-- Searching but keep the mouse in the middle of the screen
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

-- mail signatures
bind('n', '<leader>s', "<cmd>r ~/documents/signature-english.txt<CR>")
bind('n', '<leader>S', "<cmd>r ~/documents/signature-swedish.txt<CR>")

-- spell checks
bind('n', '<leader>se', "<cmd>spell spelllang=en_us<CR>")
bind('n', '<leader>ss', "<cmd>spell spelllang=sv_SE<CR>")

-- higlight colours
bind('n', '<leader>ch', "<cmd>ColorHighlight<CR>")

-- press <Esc> to exit out of insert in terminal mode
bind('t', '<Esc>', "<C-\\><C-n>")

-- write as root
bind('c', 'w!!', "execute 'silent! write !doas tee % >/dev/null'")

-- Press ? in netrw to get help
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	once = true,
	callback = function()
		bind("n", "?", "<cmd>help netrw-quickmap<CR>")
		bind("n", "<Esc><Esc>", "<cmd>bnext<CR>")
	end
})

