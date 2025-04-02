return {
  -- Fuzzy Search
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    cmd = { 'Files', 'GFiles', 'Buffers', 'Rg' },
  },
  {
    'mileszs/ack.vim',
    cmd = 'Ack',
  },
}
