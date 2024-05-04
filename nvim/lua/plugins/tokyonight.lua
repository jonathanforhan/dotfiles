return {
  {
    "jonathanforhan/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        macros = { bold = true },
        sidebars = "transparent",
        floats = "transparent"
      },
      sidebars = { "qf", "help" }
    },
    init = function()
      vim.cmd.colorscheme("tokyonight")
      vim.cmd [[
        hi DiagnosticVirtualTextInfo guibg=NONE | hi DiagnosticVirtualTextHint guibg=NONE
        hi DiagnosticVirtualTextWarn guibg=NONE | hi DiagnosticVirtualTextError guibg=NONE
      ]]
    end
  }
}
