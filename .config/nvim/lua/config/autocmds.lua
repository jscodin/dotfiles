-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "html" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- backs up lazy-lock file before updates are made in lazyvim
-- then if a plugin update breaks something, i can revert to a previous commit via lazy log
-- (because of the Telescope Colorscheme issue..)
local lazy_cmds = vim.api.nvim_create_augroup('lazy_cmds', { clear = true })
local snapshot_dir = vim.fn.stdpath('data') .. '/plugin-snapshot'
local lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json'

vim.api.nvim_create_user_command(
  'BrowseSnapshots',
  'edit ' .. snapshot_dir,
  {}
)

vim.api.nvim_create_autocmd('User', {
  group = lazy_cmds,
  pattern = 'LazyUpdatePre',
  desc = 'Backup lazy.nvim lockfile',
  callback = function(event)
    vim.fn.mkdir(snapshot_dir, 'p')
    local snapshot = snapshot_dir .. os.date('/%Y-%m-%dT%H:%M:%S.json')

    vim.loop.fs_copyfile(lockfile, snapshot)
  end,
})
