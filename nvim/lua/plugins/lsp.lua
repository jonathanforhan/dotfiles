return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local border_style = 'rounded'

      local default_setup = function(server)
        require('lspconfig')[server].setup({ capabilities = lsp_capabilities })
      end

      require('mason').setup({
        ui = { border = border_style },
      })

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
                  workspace = {
                    library = { vim.env.VIMRUNTIME }
                  }
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
        { border = border_style }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = border_style }
      )

      vim.diagnostic.config {
        float = { border = border_style }
      }
      require('lspconfig.ui.windows').default_options = { border = border_style }

      -- autocmds
      vim.api.nvim_create_autocmd('BufRead', {
        pattern = '*.wgsl',
        command = 'setlocal ft=wgsl'
      })

      vim.api.nvim_create_autocmd('BufRead', {
        pattern = { '*.vert', '*.frag', '*.tesc', '*.geom', '*.glsl' },
        command = 'setlocal ft=glsl'
      })

      vim.api.nvim_create_autocmd('Filetype', {
        pattern = { 'xml', 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'lua', 'haskell' },
        command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2'
      })

      vim.api.nvim_create_autocmd('BufWrite', {
        callback = function()
          vim.lsp.buf.format()
        end
      })

      vim.api.nvim_create_autocmd({ 'BufWrite', 'Filetype' }, {
        pattern = { '*.tex' },
        callback = function()
          local path = vim.fn.expand('%:p')
          local parent = vim.fn.expand('%:p:h')
          vim.cmd(
            ':silent !pdflatex ' .. path ..
            ' && sed -i -e s/FOO/BAR/g -e s/BAR/FOO/g ' .. parent .. '/index.html'
          )
        end
      })
    end
  },
}
