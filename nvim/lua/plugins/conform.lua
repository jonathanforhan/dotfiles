return {
  "stevearc/conform.nvim",
  ft = { "javascript", "typescript" },
  opts = {
    formatters_by_ft = {
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } }
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500
    }
  }
}
