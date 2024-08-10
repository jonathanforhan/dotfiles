return {
  "stevearc/conform.nvim",
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "format on save",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end
    })
  end,
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
