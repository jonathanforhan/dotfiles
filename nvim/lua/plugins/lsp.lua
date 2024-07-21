return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    { "folke/neodev.nvim",       ft = "lua",   opts = {} },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path"
      }
    }
  },
  init = function()
    local border_style = { border = "rounded" }

    local server_config = {
      verible = {
        cmd = { "verible-verilog-ls", "--ruleset=none" }
      },
      svls = {
        root_dir = require("lspconfig").util.root_pattern(".svls.toml", ".git")
      }
    }

    require("mason").setup({ ui = border_style })

    require("mason-lspconfig").setup({
      handlers = {
        function(server)
          local config = server_config[server] or {}
          config.capabilities = require("cmp_nvim_lsp").default_capabilities();

          require("lspconfig")[server].setup(config)
        end
      }
    })

    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<TAB>"] = cmp.mapping.select_next_item(),
        ["<S-TAB>"] = cmp.mapping.select_prev_item()
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      }
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_style)
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, border_style)
    vim.diagnostic.config({ float = border_style })

    require("lspconfig.ui.windows").default_options = border_style

    vim.keymap.set("n", "<LEADER>la", vim.lsp.buf.code_action, { desc = "Code Action" })
    vim.keymap.set("n", "<LEADER>lr", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Floating Diagnostic" })
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Type Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature" })
  end
}
