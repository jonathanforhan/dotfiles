return {
  "norcalli/nvim-colorizer.lua",
  ft = {
    "css",
    "html",
    "javascript",
    "lua",
    "typescript",
    "typst",
    "xml",
    "yaml"
  },
  cmd = "ColorizerAttachToBuffer",
  config = function()
    vim.cmd("ColorizerAttachToBuffer")
  end
}
