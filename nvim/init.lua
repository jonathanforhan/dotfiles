-- INIT --
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- GENERAL --
vim.g.mapleader = ' '
vim.g.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50

-- AUTO GROUPS --
vim.api.nvim_create_augroup('set_ft', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  group = 'set_ft',
  pattern = '*.wgsl',
  command = 'setlocal ft=wgsl'
})

vim.api.nvim_create_augroup('set_indent', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = 'set_indent',
  pattern = { 'xml', 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'yaml', 'lua' },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2'
})

vim.api.nvim_create_augroup('highlight', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'highlight',
  pattern = '*',
  callback = function()
    for _, x in ipairs({
      'DiagnosticVirtualTextError',
      'DiagnosticVirtualTextHint',
      'DiagnosticVirtualTextInfo',
      'DiagnosticVirtualTextWarn'
    }) do
      vim.api.nvim_set_hl(0, x, { bg = 'none' })
    end
  end
})

-- PLUGINS --
require('lazy').setup({
  -- auto-pairs
  { 'windwp/nvim-autopairs',            event = 'InsertEnter', opts = {} },
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
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = 'transparent',
          floats = 'transparent',
        },
        sidebars = { 'qf', 'help' },
      })
      vim.cmd.colorscheme('tokyonight')
    end
  },
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'javascript', 'typescript', 'python', 'go', 'rust' },
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
lsp_zero.on_attach(function(_, bufnr)
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
require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      telemetry = { enable = false }
    }
  }
}

-- REMAP --
vim.keymap.set('n', '<leader>w', ':LspZeroFormat<CR>:w<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set('n', '<leader>r', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})

vim.keymap.set('n', 'Q', '<nop>')
