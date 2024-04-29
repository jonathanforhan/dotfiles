return {
  {
    "stevearc/conform.nvim",
    ft = { "javascript", "typescript", "typst" },
    opts = {
      formatters_by_ft = {
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typst = { { "typstfmt" } },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500
      }
    }
  }
}
