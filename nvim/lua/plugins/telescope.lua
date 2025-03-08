return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    "nvim-tree/nvim-web-devicons"
  },
  init = function()
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")

    local function any_dir(fn)
      return function()
        fn({ search_dirs = { vim.fn.input("Directory: ", "", "file") } })
      end
    end

    vim.keymap.set("n", "<LEADER>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<LEADER>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<LEADER>fg", builtin.git_files, { desc = "Find Git Files" })
    vim.keymap.set("n", "<LEADER>fs", builtin.live_grep, { desc = "Grep" })
    vim.keymap.set("n", "<LEADER>fF", any_dir(builtin.find_files), { desc = "File Files with Path" })
    vim.keymap.set("n", "<LEADER>fS", any_dir(builtin.live_grep), { desc = "Grep with Path" })
  end
}
