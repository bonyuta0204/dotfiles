return {
  -- Editor UI
  {
    'rhysd/accelerated-jk',
    event = "VeryLazy",
  },
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
  },
  {
    'easymotion/vim-easymotion',
    event = "VeryLazy",
  },
  {
    'Yggdroot/indentLine',
    event = "BufReadPost",
  },
  {
    'bronson/vim-trailing-whitespace',
    event = "BufReadPost",
  },
  {
    'tpope/vim-surround',
    event = "VeryLazy",
  },
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascript', 'typescript', 'vue' },
  },
  {
    'voldikss/vim-floaterm',
    cmd = { 'FloatermNew', 'FloatermToggle' },
  },
  {
    'scrooloose/nerdcommenter',
    event = "VeryLazy",
  },
  {
    'scrooloose/nerdtree',
    cmd = { 'NERDTreeToggle', 'NERDTreeFind' },
  },
}
