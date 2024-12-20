-- This file was generated by setup script
-- Generated at: 2024-11-25 13:24:55

-- fzf.lua
return {
  {
    "junegunn/fzf",
    build = ":call fzf#install()",
  },
  {
    "junegunn/fzf.vim",
    config = function()
      event = "VeryLazy" 
      vim.keymap.set('n', '<leader>f', ':Files<CR>')
      vim.keymap.set('n', '<leader>g', ':Rg<CR>')
      vim.keymap.set('n', '<leader>b', ':Buffers<CR>')
      vim.keymap.set('n', '<leader>h', ':History<CR>')
    end,
  },
}
