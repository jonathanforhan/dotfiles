vim.api.nvim_create_autocmd("FileType", {
  desc = "2 space tabs",
  pattern = {
    "css",
    "haskell",
    "html",
    "javascript",
    "lua",
    "nix",
    "scheme",
    "systemverilog",
    "typescript",
    "typst",
    "verilog",
    "xml"
  },
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2"
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight on yank",
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local colors = require("tokyonight.colors").setup()

    local redefinitions = {
      ["@lsp.typemod.class.constructorOrDestructor"] = { link = "Function" }, -- Constructors and Destructors are methods
      ["@type.builtin"] = { fg = colors.purple },                             -- builtin types
      ["@lsp.typemod.type.defaultLibrary"] = { link = "Type" },               -- stdint.h types
      ["@lsp.typemod.class.defaultLibrary"] = { link = "Type" },              -- stl classes
      ["@auto_keyword"] = { fg = colors.purple },                             -- auto
      ["@lsp.type.namespace"] = { fg = colors.purple },                       -- namespaces
      ["@punctuation.bracket"] = { fg = colors.cyan },                        -- brackets
      ["@variable.parameter"] = { fg = colors.cyan },                         -- parameters
      ["@lsp.type.macro.cpp"] = { link = "Macro" },                           -- macros
    }

    for k, v in pairs(redefinitions) do
      vim.api.nvim_set_hl(0, k, v)
    end
  end,
})

--[[ *not currently used*
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "auto-compile latex",
  pattern = "*.tex",
  command = "silent !pdflatex %:p &>/dev/null"
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "ejs",
  pattern = { "*.ejs" },
  command = "set ft=html"
})
]]
