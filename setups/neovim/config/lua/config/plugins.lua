local M = {}

-- LSP configuration
M.setup_lsp = function()
  if vim.fn.has('nvim-0.5') == 0 then return end

  require('mason').setup()
  require('mason-lspconfig').setup()
  
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- Add your LSP server configurations here
  local servers = { 'pyright', 'tsserver', 'rust_analyzer' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
    }
  end
end

-- nvim-cmp configuration
M.setup_cmp = function()
  if vim.fn.has('nvim-0.5') == 0 then return end

  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })
end

-- Treesitter configuration
M.setup_treesitter = function()
  if vim.fn.has('nvim-0.7') == 0 then return end

  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "javascript",
      "typescript",
      "python",
      "rust",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
  })
end

-- jaq-nvim configuration
M.setup_jaq = function()
  require('jaq-nvim').setup{
    cmds = {
      -- Uses vim commands
      internal = {
        lua = "luafile %",
        vim = "source %"
      },
      -- Uses shell commands
      external = {
        python = "python3 %",
        javascript = "node %",
        typescript = "ts-node %",
        rust = "cargo run",
      }
    },
    behavior = {
      -- Default type
      default = "float",
      -- Start in insert mode
      startinsert = false,
      -- Use `wincmd p` on startup
      wincmd = false,
      -- Auto-save files
      autosave = false
    },
    ui = {
      float = {
        -- See ':h nvim_open_win'
        border = "rounded",
        -- See ':h winhl'
        winhl = "Normal",
        -- See ':h winblend'
        winblend = 0,
        -- Position of floating window
        x = 0.5,
        y = 0.5,
        -- Width of floating window
        width = 0.8,
        -- Height of floating window
        height = 0.8
      }
    }
  }
end

-- Setup all plugins
M.setup = function()
  M.setup_lsp()
  M.setup_cmp()
  M.setup_treesitter()
  M.setup_jaq()
end

return M
