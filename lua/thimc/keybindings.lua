vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

-- move text when highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Various motions that will keep the cursor in the middle
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- split window and set focus
vim.keymap.set("n", "<leader>v", ":vsplit<CR>:wincmd l<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>")

-- mail signatures
vim.keymap.set('n', '<leader>s', "<cmd>r ~/documents/signature-english.txt<CR>")
vim.keymap.set('n', '<leader>S', "<cmd>r ~/documents/signature-swedish.txt<CR>")

-- higlight colours
vim.keymap.set('n', '<leader>ch', "<cmd>ColorHighlight<CR>")

-- press <Esc> to exit out of insert in terminal mode
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")
