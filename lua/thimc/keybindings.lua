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
bind("n", "<leader>p", "<cmd>PackerSync<CR>")

-- quickfix navigation
bind("n", "<C-k>", "<cmd>cnext<CR>zz")
bind("n", "<C-j>", "<cmd>cprev<CR>zz")

-- telescope
builtin = require('telescope.builtin')
bind('n', '<leader>ff', builtin.find_files, {})
bind('n', '<leader>fg', builtin.live_grep, {})
bind('n', '<leader>fb', builtin.buffers, {})
bind('n', '<leader>fh', builtin.help_tags, {})

-- fugitive
bind('n', '<leader>gd', "<cmd>Git diff<CR>")
bind('n', '<leader>gl', "<cmd>Git log<CR>")
bind('n', '<leader>gs', "<cmd>Git status<CR>")

-- custom command defined in go.lua
bind('n', '<leader>xg', "<cmd>GoRun<CR>")

-- mail signatures
bind('n', '<leader>s', "<cmd>r ~/documents/signature-english.txt<CR>")
bind('n', '<leader>S', "<cmd>r ~/documents/signature-swedish.txt<CR>")

-- spell checks
bind('n', '<leader>se', "<cmd>spell spelllang=en_us<CR>")
bind('n', '<leader>ss', "<cmd>spell spelllang=sv_SE<CR>")

-- colour column
bind('n', '<leader>cc', "<cmd>set colorcolumn=80<CR>")
bind('n', '<leader>ncc', "<cmd>set colorcolumn-=80<CR>")

-- colour higlight
bind('n', '<leader>ch', "<cmd>ColorHighlight<CR>")

-- terminal
bind('n', '<leader>t', "<cmd>terminal<CR>")

-- toggle no color
bind('n', '<leader>C', "<cmd>colorscheme distcomment<CR>")

-- reload current file
bind('n', '<leader><leader>', "<cmd>so<CR>")

-- trouble
-- bind('n', '<leader>d', "<cmd>lua vim.diagnostic.setloclist()<CR>")
--bind('n', '<leader>q', "<cmd>lua vim.diagnostic.setqflist()<CR>")
bind("n", "<leader>d", "<cmd>TroubleToggle document_diagnostics<CR>")
bind("n", "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
bind("n", "<leader>dq", "<cmd>TroubleToggle quickfix<CR>")

-- VIM-style make and compiler
-- bind('n', '<leader>d', "<cmd>copen<CR>")
bind('n', '<leader>c', "<cmd>compiler<space>")
bind('n', '<leader>m', "<cmd>make<CR>")

-- ctags/uctags
-- bind('n', '<leader>]', "<cmd>split<CR><cmd>exec(\"tag \".expand(\"<cword>\"))<CR>")

-- write as root
vim.cmd [[ cnoremap w!! execute 'silent! write !doas tee % >/dev/null' ]]

