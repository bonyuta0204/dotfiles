-- setup mason.nvim
if not pcall(require, 'mason') then
  return
end

local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "tsserver", "vimls", "solargraph", "volar", "sumneko_lua" }
})

local nvim_lsp = require('lspconfig')

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- LSP key bind settings
-- @see https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local on_attach = function(client, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<F8>', function() vim.lsp.buf.format { async = true } end, bufopts)

  if client.name == 'volar' or client.name == 'tsserver' then
    -- @see: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end

end

-- setting up LSP automatically
mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {}
    opts.on_attach = on_attach

    print(server_name)

    if server_name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
        }
      }
    end

    if server_name == "hls" then
      opts.settings = {
        haskell = {
          formattingProvider = "stylish-haskell"
        }
      }
    end

    if server_name == "solargraph" then
      opts.cmd = {
        "bundle",
        "exec",
        "solargraph",
        "stdio",
      }
    end

    nvim_lsp[server_name].setup(opts)
  end
})

-- setting up null-ls

local null_ls = require("null-ls")
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier.with {
      prefer_local = "node_modules/.bin",
    },
  },
}
