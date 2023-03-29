-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Packer can manage itself

	use { -- Find files, buffers and help tags <leader>ff, fg, fb or fh.
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim'} }
	}

	-- Better syntax highlighting
	use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

	-- LSP Support
	use { 'neovim/nvim-lspconfig' }
	use { "folke/trouble.nvim" } -- Quickfix for LSP (bound to <leader>d/D)
	-- Automatic LSP server handling
	-- use { 'williamboman/mason.nvim' }
	-- use { 'williamboman/mason-lspconfig.nvim' }

	-- Autocompletion
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'saadparwaiz1/cmp_luasnip' }

	-- Snippets
	use { 'L3MON4D3/LuaSnip' }
	use { 'rafamadriz/friendly-snippets' }

	-- Theme
	use { 'folke/tokyonight.nvim' }

	use { 'mfussenegger/nvim-dap' }
	use { 'olexsmir/gopher.nvim' } -- golang commands

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	use { 'chrisbra/Colorizer' } -- higlight colors (bound to <leader>ch)

	use { 'tpope/vim-surround' } -- surround motion (ysw" to surround a word)
	use { 'tpope/vim-fugitive' } -- Git integration
	use { 'tpope/vim-repeat' } -- repeats more actions and commands
	use { 'tpope/vim-commentary' } -- comment motion (gc)
	use { 'tpope/vim-eunuch' } -- UNIX commands from the command line
end)
