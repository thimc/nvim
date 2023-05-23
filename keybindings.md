
## Keybindings
Here is a some what organized list of all my custom keybindings that I tend to use.

```
<leader>v	split window and set focus to the right split
<leader>x	opens netrw in a left split, like a tree viewer
<leader>X	opens netrw in full screen
<leader>s	append swedish mail signature
<leader>S	append swedish english signature
<leader>se	spellcheck US english
<leader>ss	spellcheck swedish
<leader>ch	highlight color codes
```
### Terminal
```
<ESC>		exit out of terminal mode
```
### Netrw
```
<?>		display netrw-quickmap
<ESC><ESC>	exit out of netrw
```

## LSP (defaults from lsp-zero)
```
K		display hover information
gd		jump to definition
gD		jump to declaration
gi		list all implementations
go		jump to symbol implementation
gr		find all references
gs		display signature
<F2>    	rename symbol
<F3>    	format buffer
<F4>    	code action
gl		show diagnostics in floating window
]d		next diagnostic
[d		prev diagnostic
```
### Custom LSP keybindings:
```
<leader>rn	rename symbol
<leader>ca	code action
<C-k>		signature help (insert mode)
```

## Completion
```
<CR>		Confirm
<C-l>		Confirm
<C-SPACE>	Trigger completion menu
<C-f>		jump forward (luasnip)
<C-b>		jump backward (luasnip)
```

## Git (Fugitive)
```
<leader>g	Launch fugitive
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
<leader>z	run buffer/project depending on the file type and file name
```

## Toggle terminal (custom)
```
<leader>t	toggles a terminal
```
