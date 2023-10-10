-- INIT --
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
vim.opt.rtp:prepend(lazypath)

-- GENERAL --
vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.termguicolors = true
vim.opt.nu = true
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
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- PLUGINS --
require('lazy').setup({
  -- auto-pairs
  { 'windwp/nvim-autopairs',            event = "InsertEnter", opts = {} },
  -- lsp-zero
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x',       lazy = true },
  {
    'neovim/nvim-lspconfig',
    dependencies = { { 'hrsh7th/cmp-nvim-lsp' } },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { { 'L3MON4D3/LuaSnip' } },
  },
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = { side = "right" },
        actions = { open_file = { quit_on_open = true } }
      })
    end
  },
  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('telescope').load_extension('fzf')
    end
  },
  -- tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "transparent",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'javascript', 'typescript', 'python', 'rust' },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end
  },
  -- vim-gitgutter
  { 'airblade/vim-gitgutter' }
})

-- CONFIG --
-- lsp-zero
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = { lsp_zero.default_setup }
})
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<tab>'] = cmp.mapping.select_next_item(),
    ['<S-tab>'] = cmp.mapping.select_prev_item(),
  })
})

-- REMAP --
vim.keymap.set('n', '<leader>w', ":LspZeroFormat<CR>:w<CR>")
vim.keymap.set('n', '<leader>q', ":LspZeroFormat<CR>:wq<CR>")

vim.keymap.set('n', '<leader>o', ":NvimTreeFocus<CR>")
vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>")

vim.keymap.set('n', '<leader>b', ":Telescope buffers<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- EXTRA --
vim.cmd [[:hi DiagnosticVirtualTextError guibg=NONE]]
vim.cmd [[:hi DiagnosticVirtualTextHint guibg=NONE]]
vim.cmd [[:hi DiagnosticVirtualTextInfo guibg=NONE]]
vim.cmd [[:hi DiagnosticVirtualTextWarn guibg=NONE]]

vim.cmd [[:autocmd BufEnter *.[jt]s :setlocal tabstop=2 shiftwidth=2 softtabstop=2]]
vim.cmd [[:autocmd BufEnter *.[jt]sx :setlocal tabstop=2 shiftwidth=2 softtabstop=2]]
vim.cmd [[:autocmd BufEnter *.lua :setlocal tabstop=2 shiftwidth=2 softtabstop=2]]
vim.cmd [[:autocmd BufEnter *.html :setlocal tabstop=2 shiftwidth=2 softtabstop=2]]
