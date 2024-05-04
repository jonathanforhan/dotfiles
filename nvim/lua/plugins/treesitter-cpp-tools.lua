return {
  {
    "Badhi/nvim-treesitter-cpp-tools",
    ft = "cpp",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      preview = {
        quit = "q",
        accept = "<CR>"
      },
      header_extension = "hpp",
      source_extension = "cpp"
    }
  }
}
