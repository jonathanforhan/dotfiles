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
vim.opt.number = true
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

-- AUTO COMMANDS --
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.wgsl',
  command = 'setlocal ft=wgsl'
})
vim.api.nvim_create_autocmd('BufRead', {
  pattern = { '*.vert', '*.frag', '*.tesc', '*.geom', '*.glsl' },
  command = 'setlocal ft=glsl'
})

vim.api.nvim_create_autocmd({ 'BufWrite', 'BufEnter' }, {
  callback = function()
    require('lint').try_lint()
  end
})

vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function()
    vim.lsp.buf.format()
  end
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'xml', 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'yaml', 'lua' },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2 | ColorizerAttachToBuffer'
})

-- PLUGINS --
require('lazy').setup({
  -- auto-pairs
  { 'windwp/nvim-autopairs',            event = 'InsertEnter', opts = {} },
  -- colorizer --
  { 'norcalli/nvim-colorizer.lua' },
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
  -- lualine --
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { component_separators = '', section_separators = '' },
        sections = {
          lualine_a = { { 'mode', fmt = function(_) return 'λ' end } }
        }
      })
    end
  },
  -- nvim lint --
  { 'mfussenegger/nvim-lint', lazy = false },
  -- nvim treesitter cpp tools
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = function()
      return {
        preview = {
          quit = "q",
          accept = "<CR>",
        },
        header_extension = "hpp",
        source_extension = "cpp",
      }
    end,
    config = true,
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
      vim.cmd [[
        hi DiagnosticVirtualTextInfo guibg=NONE | hi DiagnosticVirtualTextHint guibg=NONE
        hi DiagnosticVirtualTextWarn guibg=NONE | hi DiagnosticVirtualTextError guibg=NONE
      ]]
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
        },
        indent = { enable = true }
      })
    end
  },
  -- vim-gitgutter
  { 'airblade/vim-gitgutter' },
})

-- CONFIG --
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = { lsp_zero.default_setup }
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      telemetry = { enable = false }
    }
  }
}

lspconfig.clangd.setup({
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--cross-file-rename',
    '--header-insertion=iwyu',
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
})

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
  })
})

require('lint').linters_by_ft = {
  cpp = { 'cppcheck' }
}

-- REMAP --
local builtin = require('telescope.builtin')
local function any_dir(fn)
  fn({ search_dirs = { vim.fn.input('Directory: ', '', 'file') } })
end

vim.keymap.set('n', '<LEADER>p', '<CMD>b#<CR>')

vim.keymap.set('n', '<LEADER>b', builtin.buffers, {})
vim.keymap.set('n', '<LEADER>f', builtin.find_files, {})
vim.keymap.set('n', '<LEADER>g', builtin.git_files, {})
vim.keymap.set('n', '<LEADER>o', builtin.oldfiles, {})
vim.keymap.set('n', '<LEADER>s', builtin.live_grep, {})
vim.keymap.set('n', '<LEADER>F', function() any_dir(builtin.find_files) end, {})
vim.keymap.set('n', '<LEADER>S', function() any_dir(builtin.live_grep) end, {})

vim.keymap.set('n', '<LEADER>m', '<CMD>TSCppDefineClassFunc<CR><CMD>ClangdSwitchSourceHeader<CR>')
vim.keymap.set('v', '<LEADER>m', '<CMD>TSCppDefineClassFunc<CR><CMD>ClangdSwitchSourceHeader<CR>')
vim.keymap.set('n', '<LEADER>M', '<CMD>TSCppDefineClassFunc<CR>')
vim.keymap.set('v', '<LEADER>M', '<CMD>TSCppDefineClassFunc<CR>')

vim.keymap.set('n', '<LEADER>a', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<LEADER>i', vim.diagnostic.open_float, {})
vim.keymap.set('n', '<LEADER>r', vim.lsp.buf.rename, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

vim.keymap.set('n', '<C-k><C-o>', '<CMD>ClangdSwitchSourceHeader<CR>')

vim.keymap.set('n', 'Q', '<NOP>')

local function get_char()
  return vim.fn.getcharstr()
end

vim.keymap.set('n', '<LEADER>k', function() vim.cmd('exe "normal! a\\<C-k>' .. get_char() .. '*"') end)
vim.keymap.set('i', '<C-K>', function() vim.cmd('exe "normal! a\\<C-k>' .. get_char() .. '*"') end)
