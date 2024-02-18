return {
  {
    "numToStr/Comment.nvim",
    config = function(_, opts)
      opts = {
        toggler = {
          line = "<LEADER>c",
          block = "<LEADER>b",
        },
        opleader = {
          line = "<LEADER>c",
          block = "<LEADER>b",
        },
        mappings = {
          extra = false,
        }
      }
      require("Comment").setup(opts)
    end
  }
}
