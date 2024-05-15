return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim"
    },
    opts = {
      window = {
        position = "float"
      }
    },
    init = function()
      vim.keymap.set("n", "<LEADER>.", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
    end
  }
}
