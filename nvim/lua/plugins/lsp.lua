return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = function()
        require("mason").setup()
      end
    },
    "neovim/nvim-lspconfig",
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
  config = function()
    local border_style   = { border = "rounded" }

    local signature_help = function() vim.lsp.buf.signature_help(border_style) end
    local hover          = function() vim.lsp.buf.hover(border_style) end

    vim.keymap.set("n", "<LEADER>la", vim.lsp.buf.code_action, { desc = "Code Action" })
    vim.keymap.set("n", "<LEADER>lr", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Floating Diagnostic" })
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Type Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
    vim.keymap.set("n", "gs", signature_help, { desc = "Signature" })
    vim.keymap.set("n", "K", hover, { desc = "Signature" })

    require("lspconfig.ui.windows").default_options = border_style
    vim.diagnostic.config({ float = border_style })

    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--suggest-missing-includes",
        "--completion-style=detailed",
        "--cross-file-rename",
        "--header-insertion=iwyu"
      },
      init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true
      }
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }
        }
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "cmake",
        "html",
        "ltex",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls"
      },
      automatic_enable = true,
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
        { name = "path" }
      }
    })
  end
}
