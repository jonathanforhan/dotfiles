vim.api.nvim_create_autocmd("BufEnter", {
  desc = "add buffer to harpoon",
  pattern = "*.*",
  callback = function()
    require("harpoon"):list():add()
  end
})

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = { save_on_toggle = true }
    })

    vim.keymap.set("n", "<LEADER>;", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon" })
  end
}
