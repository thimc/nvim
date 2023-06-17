# Keybindings
```
<leader>v	split window and set focus to the right split
<leader>h	shift focus to left window
<leader>l	shift focus to right window
<leader>d	open netrw
<leader>s	append swedish mail signature
<leader>S	append swedish english signature
<leader>se	spellcheck US english
<leader>ss	spellcheck swedish
<leader>ch	highlight color codes
```

## Terminal
```
<ESC>		exit terminal mode
```

## LSP (defaults from lsp-zero)
```
K		display hover information
gd		jump to definition
gD		jump to declaration
gi		jump or list all implementations
go		jump to symbol implementation
gr		jump or find all references
gs		display signature
<F2>    rename symbol
<F3>    format buffer
<F4>    code action
gl		show diagnostics in floating window
]d		next diagnostic
[d		prev diagnostic
```

### Custom LSP keybindings:
```
<leader>rn	rename symbol
<leader>ca	code action
<C-k>		signature help (insert mode)
<leader>k	open vim diagnostic loclist
```

## Completion
```
<CR>		confirm
<C-l>		confirm
<C-SPACE>	trigger completion
<C-f>		jump forward (luasnip)
<C-b>		jump backward (luasnip)
<C-u>       scroll up documentation
<C-d>       scroll down documentation
```

## Git (Fugitive)
```
<leader>g	launch fugitive
```

## Telescope
```
<leader>fb	find buffer
<leader>ff	find file
<leader>fg	find grep
<leader>fr	find old files
```

## Trouble (LSP Diagnostics)
```
<leader>q	toggle document diagnostics
<leader>qw	toggle workspace diagnostics
```

## Code runner (custom)
```
<leader>z	run buffer/project
```

## Toggle terminal (custom)
```
<leader>t	toggles a terminal
```

