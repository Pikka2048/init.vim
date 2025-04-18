-- This file was generated by setup script
-- Generated at: 2024-11-25 13:24:55

-- plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- プラグインの設定を別ファイルに分割
  require('plugins.fern'),
  require('plugins.rustaceanvim'),
  require('plugins.yanky'),
  require('plugins.commentary'),
  require('plugins.airline'),
  require('plugins.coc'),
  require('plugins.nord'),
  require('plugins.fzf'),
  require('plugins.gen'),

})

-- ~/.config/nvim/lua/plugins/fern.lua
-- Fernプラグインの設定
return {
  "lambdalisue/fern.vim",
  dependencies = {
    "lambdalisue/fern-git-status.vim",
    "lambdalisue/fern-renderer-nerdfont.vim",
    "lambdalisue/nerdfont.vim",
  },
  config = function()
    vim.g["fern#renderer"] = "nerdfont"
    vim.g["fern#default_hidden"] = 1
    
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>e', ':Fern . -drawer -toggle<CR>', opts)
    
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "fern",
      callback = function()
        local buffer_opts = { buffer = true, noremap = true, silent = true }
        vim.keymap.set('n', 'N', ':Fern . -drawer<CR>', buffer_opts)
        
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
      end,
    })
    
    vim.g["fern#renderer#nerdfont#indent_markers"] = 1
    vim.g["fern_git_status#disable_ignored"] = 1
    vim.g["fern_git_status#disable_untracked"] = 0
    vim.g["fern_git_status#disable_submodules"] = 0
  end,
}
