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

-- LSP key bind settings
-- @see https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<F8>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  if client.name == 'volar'  or client.name == 'tsserver' then
    -- @see: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
    client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
  end

end

-- setting up LSP automatically
mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {}
    opts.on_attach = on_attach

    if server_name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
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
