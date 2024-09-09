local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  -- use "EdenEast/nightfox.nvim"
  --use "rebelot/kanagawa.nvim"
  -- use { "catppuccin/nvim", as = "catppuccin" }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'}
      }
  use 'nvim-lualine/lualine.nvim'
  use 'vim-test/vim-test'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-autopairs'
  use "akinsho/toggleterm.nvim"
  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"
  use{
    "williamboman/mason.nvim",
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
     }
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
      }
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
