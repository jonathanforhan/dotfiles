local major = 0
local minor = 10
local patch = 4

local version = vim.version()

if not (version.major == major and version.minor == minor and version.patch == patch) then
  vim.notify(
    string.format("neovim version %d.%d.%d is required, current version: %d.%d.%d",
      major, minor, patch, version.major, version.minor, version.patch),
    vim.log.levels.ERROR
  )
end

vim.g.mapleader = " "
vim.g.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"

require("autocmd")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    import = "plugins"
  },
  ui = {
    border = "rounded"
  },
  change_detection = {
    notify = false
  }
})

vim.cmd.colorscheme("tokyonight")
