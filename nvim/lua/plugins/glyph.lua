vim.keymap.set("i", "<C-k>", function()
  require("nvim-glyph").pick_glyph()
end)

return {
  "jonathanforhan/nvim-glyph",
  lazy = true,
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    exclude_catagories = {
      "latin",
      "cyrillic",
      "hebrew",
      "arabic",
      "box",
      "japanese"
      -- "other"
    },
    exclude_code = { 182 }
  }
}
