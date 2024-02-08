
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
  require("artem-lazy.plugins.telescope")
vim.opt.rtp:prepend(lazypath)

require("artem-lazy.vim-options")

return require("lazy").setup("artem-lazy.plugins")

