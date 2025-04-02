return {
  -- Git Client
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },

  -- Fuzzy Search
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end
  },
  { 'junegunn/fzf.vim' },
  { 'mileszs/ack.vim' },

  -- Editor UI
  { 'rhysd/accelerated-jk' },
  { 'vim-airline/vim-airline' },
  { 'vim-airline/vim-airline-themes' },
  { 'easymotion/vim-easymotion' },
  { 'Yggdroot/indentLine' },
  { 'bronson/vim-trailing-whitespace' },
  { 'tpope/vim-surround' },
  { 'mattn/emmet-vim' },
  { 'voldikss/vim-floaterm' },
  { 'scrooloose/nerdcommenter' },

  -- Quick run
  { 'thinca/vim-quickrun' },
  { 'is0n/jaq-nvim' },

  -- Test runner
  { 'vim-test/vim-test' },

  -- Mason

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    cond = vim.fn.has('nvim-0.5') == 1
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cond = vim.fn.has('nvim-0.7') == 1
  },

  -- Filer
  { 'scrooloose/nerdtree' },

  -- Color Schema
  { 'KeitaNakamura/neodark.vim' },
  { 'tomasr/molokai' },
  { 'morhetz/gruvbox' },

  -- Lint (for older Neovim versions)
  {
    'w0rp/ale',
    cond = vim.fn.has('nvim-0.7') == 0
  },

  -- Syntax Highlight
  { 'othree/html5.vim' },
  { 'digitaltoad/vim-pug' },
  { 'cespare/vim-toml' },
  { 'othree/yajs.vim' },
  { 'posva/vim-vue' },
  { 'dag/vim-fish' },

  -- Uncomment to enable Copilot
  -- { 'github/copilot.vim' },
}
