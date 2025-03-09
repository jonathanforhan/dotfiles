return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
      keywords = { italic = false },
      sidebars = "transparent",
      floats = "transparent"
    },
    sidebars = { "qf", "help" },
    plugins = { markdown = true },
    on_colors = function(colors)
      colors.bg_visual = "#505050"
    end,
    on_highlights = function(highlights, colors)
      highlights.DiagnosticVirtualTextInfo.bg = colors.none
      highlights.DiagnosticVirtualTextHint.bg = colors.none
      highlights.DiagnosticVirtualTextWarn.bg = colors.none
      highlights.DiagnosticVirtualTextError.bg = colors.none

      highlights.Type = { fg = "#ecc48d" }
      highlights.Function = { fg = "#82aaff" }
      highlights.PreProc["bold"] = true
    end
  }
}
