-- autocmds

vim.api.nvim_create_augroup("AuFormat", {})
vim.api.nvim_create_augroup("AuFiletype", {})
vim.api.nvim_create_augroup("AuCompile", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "AuFormat",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end
})

vim.api.nvim_create_autocmd("BufRead", {
  group = "AuFiletype",
  pattern = { "*.vert", "*.frag", "*.tesc", "*.geom", "*.glsl" },
  command = "setlocal ft=glsl"
})

vim.api.nvim_create_autocmd("Filetype", {
  group = "AuFiletype",
  pattern = { "xml", "html", "css", "javascript", "typescript", "jsx", "tsx", "lua", "haskell" },
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2"
})

vim.api.nvim_create_autocmd({ "BufWrite", "Filetype" }, {
  group   = "AuCompile",
  pattern = "*.tex",
  command = ":silent !pdflatex %:p &>/dev/null"
})
