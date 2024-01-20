return {
  {
    "Badhi/nvim-treesitter-cpp-tools",
    ft = 'cpp',
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = function()
      return {
        preview = {
          quit = "q",
          accept = "<CR>"
        },
        header_extension = "hpp",
        source_extension = "cpp",
      }
    end,
    config = true,
  }
}
