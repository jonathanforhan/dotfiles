return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      desc = "add buffer to harpoon",
      pattern = "*.*",
      callback = function()
        require("harpoon"):list():add()
      end
    })
  end,
  opts = {
    settings = { save_on_toggle = true }
  },
  config = function(_, opts)
    local harpoon = require("harpoon")

    harpoon:setup(opts)

    vim.keymap.set("n", "<LEADER>;", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon" })
  end
}
