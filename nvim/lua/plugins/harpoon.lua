return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<LEADER>;", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  end
}
