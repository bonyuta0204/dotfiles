return {
  -- LSP
  {
    'williamboman/mason.nvim',
    opts = {}
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = { "ts_ls", "vimls", "solargraph", "vue_ls" },
      automatic_enable = true,
    },
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
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
      if ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      for _, server in ipairs({ "ts_ls", "vimls", "solargraph", "vue_ls" }) do
        vim.lsp.config(server, { capabilities = capabilities })
      end
    end,
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
