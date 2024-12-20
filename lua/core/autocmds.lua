-- This file was generated by setup script
-- Generated at: 2024-11-25 13:24:55

-- autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ターミナル設定用のautocmd
local terminal_settings = augroup('TerminalSettings', { clear = true })
autocmd('TermOpen', {
    group = terminal_settings,
    pattern = '*',
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.cmd('startinsert')
    end,
})
