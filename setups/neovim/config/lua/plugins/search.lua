return {
  -- Fuzzy Search
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    config = function()
      require('fzf-lua').setup()

      vim.keymap.set('n', '<leader>ef', "<cmd>lua require('fzf-lua').files()<CR>")
      vim.keymap.set('n', '<leader>ag', "<cmd>lua require('fzf-lua').grep_project()<CR>")
      vim.keymap.set('n', '<leader>eb', "<cmd>lua require('fzf-lua').buffers()<CR>")
      
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
