vim.keymap.set("n", "<LEADER>.", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    window = {
      position = "float"
    }
  }
}
