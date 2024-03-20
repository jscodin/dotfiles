-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- wiki.vim setup
vim.g.wiki_root = "~/mywiki"

-- fix line wrap
vim.wo.linebreak = true

--stops inline tags in emmet (HTML)
vim.g.user_emmet_settings = {
  html = {
    block_all_childless = 1,
  },
}

-- WSL yank support
vim.opt.clipboard = "unnamedplus"

if vim.fn.has('wsl') == 1 then
  vim.api.nvim_create_autocmd('TextYankPost', {

    group = vim.api.nvim_create_augroup('Yank', { clear = true }),

    callback = function()
      vim.fn.system('clip.exe', vim.fn.getreg('"'))
    end,

  })
end
