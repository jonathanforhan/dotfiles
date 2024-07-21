vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "format on save",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end
})

return {
  "stevearc/conform.nvim",
  lazy = false,
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
