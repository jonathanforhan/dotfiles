return {
  {
    "norcalli/nvim-colorizer.lua",
    init = function()
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = { "xml", "html", "css", "javascript", "typescript", "jsx", "tsx", "yaml", "lua" },
        command = "ColorizerAttachToBuffer"
      })
    end
  }
}
