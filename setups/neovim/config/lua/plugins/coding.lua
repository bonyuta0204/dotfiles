return {
  -- LSP
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
  ensure_installed = { "tsserver", "vimls", "solargraph", "volar", "lua_ls" }
    }
  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
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
    cond = vim.fn.has('nvim-0.5') == 1,
    config = function()
      require('config.plugins').setup_lsp()
      require('config.plugins').setup_cmp()
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.fn.has('nvim-0.7') == 1,
    config = function()
      require('config.plugins').setup_treesitter()
    end,
  },

  -- Quick run
  {
    'thinca/vim-quickrun',
    cmd = 'QuickRun',
  },
  {
    'is0n/jaq-nvim',
    cmd = 'Jaq',
    config = function()
      require('config.plugins').setup_jaq()
    end,
  },

  -- Test runner
  {
    'vim-test/vim-test',
    cmd = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' },
  },

  -- Lint
  {
    'w0rp/ale',
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.fn.has('nvim-0.7') == 0,
  },
}
