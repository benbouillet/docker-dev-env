-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
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
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'preservim/nerdtree'
  
  -- Theme
  use 'shaunsingh/nord.nvim'
  
  -- A command-line fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  }  

  -- Commenting
  use 'tpope/vim-commentary'
  
  -- Syntax HighlightinPlug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}g
  use {'numirias/semshi', ft = 'python', config = 'vim.cmd [[UpdateRemotePlugins]]'}
  
  -- Python PEP8 autoindent
  use 'Vimjas/vim-python-pep8-indent'
  
  -- Minimal statusbar
  use 'nvim-lualine/lualine.nvim'
  -- If you want to have icons in your statusline choose one of these
  use 'kyazdani42/nvim-web-devicons'
  
  -- provides some Python-specific text objects: classes, functions, etc
  use 'jeetsukumaran/vim-pythonsense'
  
  -- inserts closing quotes and parenthesis as you type
  use 'jiangmiao/auto-pairs'
  
  -- allows git commands in vim session
  use 'tpope/vim-fugitive'
  
  -- shows git changes in gutter
  use 'airblade/vim-gitgutter'
  
  -- easy motion
  use 'phaazon/hop.nvim'
  
  -- scrolling 'C-d' or 'C-u'
  use 'yuttie/comfortable-motion.vim'
  
  -- Python sort imports [dep]: pip3 install isort
  use 'fisadev/vim-isort'
  
  -- Markdown preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  
  -- Python Snippets
  use 'SirVer/ultisnips'
  
  -- Snippets are separated from the engine. Add this if you want them:
  use 'honza/vim-snippets'
  
  -- Code folding (zo: open, zc: close)
  use 'tmhedberg/SimpylFold'
  
  -- high-performance color highlighter
  use 'norcalli/nvim-colorizer.lua'
  
  -- LSP & auto-complete
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'

  if packer_bootstrap then
    require('packer').sync()
  end 
end)
