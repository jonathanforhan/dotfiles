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

vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function()
    vim.lsp.buf.format()
  end
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'xml', 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'lua', 'haskell' },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2'
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'xml', 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'yaml', 'lua' },
  command = 'ColorizerAttachToBuffer'
})

-- PLUGINS --
require('lazy').setup({
  -- auto-pairs
  { 'windwp/nvim-autopairs',            event = 'InsertEnter', opts = {} },
  -- better-digraphs
  {
    'jonathanforhan/best-digraphs.nvim',
    dependencies = { { 'nvim-telescope/telescope.nvim' } }
  },
  -- colorizer
  { 'norcalli/nvim-colorizer.lua' },
  -- lsp
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'neovim/nvim-lspconfig',
    dependencies = { { 'hrsh7th/cmp-nvim-lsp' } },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { { 'L3MON4D3/LuaSnip' } },
  },
  -- lualine
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
  -- nvim-treesitter-cpp-tools
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = function()
      return {
        preview = { quit = "q", accept = "<CR>" },
        header_extension = "hpp",
        source_extension = "cpp",
      }
    end,
    config = true,
  },
  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
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
    'jonathanforhan/tokyonight.nvim',
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
          macros = { bold = true },
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
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'javascript', 'typescript', 'python', 'go', 'rust', 'haskell' },
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
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  -- vim-gitgutter
  { 'airblade/vim-gitgutter' },
})

-- CONFIG --
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
  require('lspconfig')[server].setup({ capabilities = lsp_capabilities })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
            workspace = { library = { vim.env.VIMRUNTIME } }
          }
        }
      }
    end,
    clangd = function()
      require('lspconfig').clangd.setup {
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
        }
      }
    end
  }
})

local cmp = require('cmp')
cmp.setup({
  sources = { { name = 'nvim_lsp' } },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

vim.diagnostic.config {
  float = { border = 'rounded' }
}
require('lspconfig.ui.windows').default_options = { border = 'rounded' }

-- REMAP --
local builtin = require('telescope.builtin')
local function any_dir(fn)
  fn({ search_dirs = { vim.fn.input('Directory: ', '', 'file') } })
end

-- buffer-navigation
vim.keymap.set('n', '<LEADER>p', '<CMD>b#<CR>')
vim.keymap.set('n', '<LEADER>b', builtin.buffers)
vim.keymap.set('n', '<LEADER>f', builtin.find_files)
vim.keymap.set('n', '<LEADER>g', builtin.git_files)
vim.keymap.set('n', '<LEADER>o', builtin.oldfiles)
vim.keymap.set('n', '<LEADER>s', builtin.live_grep)
vim.keymap.set('n', '<LEADER>F', function() any_dir(builtin.find_files) end)
vim.keymap.set('n', '<LEADER>S', function() any_dir(builtin.live_grep) end)
vim.keymap.set('n', '<LEADER>t', function() require('trouble').toggle() end)
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- git
vim.keymap.set('n', '<LEADER>G', '<CMD>GitGutterPreviewHunk<CR>')

-- cpp
vim.keymap.set('n', '<LEADER>m', '<CMD>TSCppDefineClassFunc<CR><CMD>ClangdSwitchSourceHeader<CR>')
vim.keymap.set('v', '<LEADER>m', '<CMD>TSCppDefineClassFunc<CR><CMD>ClangdSwitchSourceHeader<CR>')
vim.keymap.set('n', '<LEADER>M', '<CMD>TSCppDefineClassFunc<CR>')
vim.keymap.set('v', '<LEADER>M', '<CMD>TSCppDefineClassFunc<CR>')
vim.keymap.set('n', '<LEADER>h', '<CMD>ClangdSwitchSourceHeader<CR>')

-- lsp
vim.keymap.set('n', '<LEADER>a', vim.lsp.buf.code_action)
vim.keymap.set('n', '<LEADER>r', vim.lsp.buf.rename)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

vim.keymap.set('n', 'Q', '<NOP>')

-- digraphs
vim.keymap.set('n', '<LEADER>k', function()
  vim.cmd [[lua require('best-digraphs').digraphs('insert')]]
end)
