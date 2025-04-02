return {
  -- Color Schema
  {
    'KeitaNakamura/neodark.vim',
    lazy = false, -- load during startup
  },
  {
    'tomasr/molokai',
    lazy = false,
  },
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000, -- load this before all the other start plugins
  },
}
