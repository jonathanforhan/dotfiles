return {
  "jonathanforhan/markdown-preview.nvim",
  cmd = {
    "MarkdownPreviewToggle",
    "MarkdownPreview",
    "MarkdownPreviewStop"
  },
  build = "cd app && yarn install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end
}
