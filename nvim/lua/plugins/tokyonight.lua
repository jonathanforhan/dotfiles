return {
  "folke/tokyonight.nvim",
  lazy = false,
  init = function()
    vim.cmd.colorscheme("tokyonight")
  end,
  opts = {
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent"
    },
    sidebars = { "qf", "help" },
    plugins = { markdown = true },
    on_highlights = function(highlights, colors)
      highlights.PreProc.bold = true
      highlights.DiagnosticVirtualTextInfo.bg = colors.none
      highlights.DiagnosticVirtualTextHint.bg = colors.none
      highlights.DiagnosticVirtualTextWarn.bg = colors.none
      highlights.DiagnosticVirtualTextError.bg = colors.none
    end
  }
}
