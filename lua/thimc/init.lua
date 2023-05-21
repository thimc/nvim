require('thimc.settings')
require('thimc.keybindings')

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)
	use {'wbthomason/packer.nvim'}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = {'nvim-lua/plenary.nvim'},
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({
				with_sync = true
			})
			ts_update()
		end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'jose-elias-alvarez/null-ls.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lua'},
			{'hrsh7th/cmp-cmdline'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},

			-- Diagnostics
			{'folke/trouble.nvim'},

			-- Go
			{'olexsmir/gopher.nvim'},
		},
	}

	use {'ellisonleao/gruvbox.nvim'}
	use {'CreaturePhil/vim-handmade-hero'}

	use {'mbbill/undotree'}
	use {'chrisbra/Colorizer'}

	use {'tpope/vim-surround'}
	use {'tpope/vim-fugitive'}
	use {'tpope/vim-repeat'}
	use {'tpope/vim-commentary'}
	use {'tpope/vim-eunuch'}
end)

