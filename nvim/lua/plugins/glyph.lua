return {
  {
    "jonathanforhan/nvim-glyph",
    dependencies = { { "nvim-telescope/telescope.nvim" } },
    event = "BufReadPost",
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
}
