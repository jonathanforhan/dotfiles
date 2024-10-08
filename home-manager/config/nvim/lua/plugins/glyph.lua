return {
  "jonathanforhan/nvim-glyph",
  lazy = true,
  dependencies = { "nvim-telescope/telescope.nvim" },
  init = function()
    vim.keymap.set("i", "<C-k>", function()
      require("nvim-glyph").pick_glyph()
    end)
  end,
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
