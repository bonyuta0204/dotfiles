return {
  -- LSP
  {
    'williamboman/mason.nvim',
    opts = {}
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "tsserver", "vimls", "solargraph", "volar" }
      })
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
      }
    end
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
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    cond = vim.fn.has('nvim-0.7') == 1,
  },

  -- Quick run
  {
    'thinca/vim-quickrun',
    cmd = 'QuickRun',
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
