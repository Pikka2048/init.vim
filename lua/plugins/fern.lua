-- This file was generated by setup script
-- Generated at: 2024-11-25 13:24:55

-- fern.lua
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
    vim.keymap.set('n', '<Leader>e', ':Fern . -drawer -stay<CR>', opts)
    
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "fern",
      callback = function()
        local buffer_opts = { buffer = true, noremap = true, silent = true }
        vim.keymap.set('n', 'N', ':Fern . -drawer -stay<CR>', buffer_opts)
        
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
