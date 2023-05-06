require("thimc.settings")
require("thimc.keybindings")

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	use "wbthomason/packer.nvim" -- Packer can manage itself

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" }
	}

	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'hrsh7th/cmp-cmdline'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use { "folke/trouble.nvim" }

	-- Theme
	use {
		"bbenzikry/snazzybuddy.nvim",
		requires = { "tjdevries/colorbuddy.nvim" }
	}
	-- use { "erikbackman/aurora.vim" }

	-- use { "mfussenegger/nvim-dap" } -- golang debugger
	use { "olexsmir/gopher.nvim" } -- golang

	use { "mbbill/undotree" } -- undo tree
	use { "chrisbra/Colorizer" } -- higlight colors (bound to <leader>ch)

	use { "tpope/vim-surround" } -- surround motion (ysw" to surround a word)
	use { "tpope/vim-fugitive" } -- Git integration
	use { "tpope/vim-repeat" } -- repeats more actions and commands
	use { "tpope/vim-commentary" } -- comment motion (gc)
	use { "tpope/vim-eunuch" } -- UNIX commands from the command line
end)


