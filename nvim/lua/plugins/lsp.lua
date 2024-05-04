return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/nvim-cmp" },
      {
        "L3MON4D3/LuaSnip",
        build = "make install jsregexp"
      },
      { "folke/neodev.nvim", ft = "lua", opts = {} }
    },
    init = function()
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_config = require("lspconfig")
      local border_style = "rounded"

      local server_config = {
        verible = {
          cmd = { "verible-verilog-ls", "--ruleset=none" }
        },
        svls = {
          root_dir = lsp_config.util.root_pattern(".svls.toml", ".git")
        }
      }

      require("mason").setup({
        ui = { border = border_style }
      })

      require("mason-lspconfig").setup({
        handlers = {
          function(server)
            local config = server_config[server] or {}
            config.capabilities = lsp_capabilities;

            lsp_config[server].setup(config)
          end
        }
      })

      local cmp = require("cmp")
      cmp.setup({
        sources = { { name = "nvim_lsp" } },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<TAB>"] = cmp.mapping.select_next_item(),
          ["<S-TAB>"] = cmp.mapping.select_prev_item()
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        }
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = border_style }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = border_style }
      )

      vim.diagnostic.config({
        float = { border = border_style }
      })

      require("lspconfig.ui.windows").default_options = { border = border_style }
    end
  }
}
