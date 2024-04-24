return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/nvim-cmp" },
      { "L3MON4D3/LuaSnip" },
      { "folke/neodev.nvim",                ft = "lua", opts = {} }
    },
    init = function()
      -- standard vim keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help)
      vim.keymap.set("n", "gl", vim.diagnostic.open_float)

      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_config = require("lspconfig")
      local border_style = "rounded"

      require("mason").setup({
        ui = { border = border_style },
      })

      require("mason-lspconfig").setup({
        handlers = {
          function(server)
            lsp_config[server].setup({ capabilities = lsp_capabilities })
          end
        }
      })

      local cmp = require("cmp")
      cmp.setup({
        sources = { { name = "nvim_lsp" } },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<TAB>"] = cmp.mapping.select_next_item(),
          ["<S-TAB>"] = cmp.mapping.select_prev_item(),
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
  },
}
