vim.g.mapleader = " "

-- move text when highlighted
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- J but keep the cursor where it was
vim.keymap.set("n", "J", "mzJ`z")

-- split window and set focus
vim.keymap.set("n", "<leader>v", ":vsplit<CR>:wincmd l<CR>")

-- Tree explorer, basically nvimtree
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

-- Searching but keep the mouse in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- mail signatures
vim.keymap.set('n', '<leader>s', "<cmd>r ~/documents/signature-english.txt<CR>")
vim.keymap.set('n', '<leader>S', "<cmd>r ~/documents/signature-swedish.txt<CR>")

-- spell checks
vim.keymap.set('n', '<leader>se', "<cmd>spell spelllang=en_us<CR>")
vim.keymap.set('n', '<leader>ss', "<cmd>spell spelllang=sv_SE<CR>")

-- higlight colours
vim.keymap.set('n', '<leader>ch', "<cmd>ColorHighlight<CR>")

-- press <Esc> to exit out of insert in terminal mode
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")

-- write as root
vim.keymap.set('c', 'w!!', "execute 'silent! write !doas tee % >/dev/null'")

-- Press ? in netrw to get help
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	once = true,
	callback = function()
		vim.keymap.set("n", "?", "<cmd>help netrw-quickmap<CR>")
		vim.keymap.set("n", "<Esc><Esc>", "<cmd>bnext<CR>")
	end
})

