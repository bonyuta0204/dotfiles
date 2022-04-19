-- nvim-lsp-installer settings
-- @see https://github.com/williamboman/nvim-lsp-installer
-- @see https://zenn.dev/nazo6/articles/c2f16b07798bab
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.on_attach = on_attach

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
