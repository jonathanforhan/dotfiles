vim.api.nvim_create_autocmd("FileType", {
  desc = "highlight hex with color: #BADA55",
  pattern = {
    "css",
    "html",
    "javascript",
    "lua",
    "typescript",
    "typst",
    "xml",
    "yaml"
  },
  command = "ColorizerAttachToBuffer"
})

return {
  "norcalli/nvim-colorizer.lua",
  cmd = "ColorizerAttachToBuffer"
}
