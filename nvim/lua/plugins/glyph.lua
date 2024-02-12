return {
  {
    'jonathanforhan/nvim-glyph',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }
    },
    opts = {
      exclude_catagories = {
        'latin',
        'cyrillic',
        'hebrew',
        'arabic',
        'box',
        'japanese',
        'other'
      },
      exclude_code = { 182 },
    }
  }
}
