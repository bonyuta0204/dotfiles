-- Set leader key before lazy
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy.nvim so your mappings are correct

-- Load basic vim settings
vim.cmd('runtime! ftplugin/man.vim')

-- Set up omnifunc for LSP
vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

-- Enable filetype plugin and indent
vim.cmd('filetype indent plugin on')

-- Setup diagnostic configuration
require("config.diagnostic").setup()

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Load basic vim settings
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/init/basic.vim')
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/init/mapping.vim')
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/init/window.vim')

-- Load colorscheme settings
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/init/color.vim')

-- Load terminal settings (after color settings)
vim.cmd('source ' .. vim.fn.stdpath("config") .. '/init/terminal.vim')

-- Load plugin settings
vim.cmd('runtime! init/plugins/**/*.vim')
if vim.fn.has('nvim-0.5') == 1 then
  vim.cmd('runtime! init/plugins/**/*.lua')
end
