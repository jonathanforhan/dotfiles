return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { component_separators = '', section_separators = '' },
        sections = {
          lualine_a = {
            { 'mode', fmt = function(_) return 'λ' end }
          }
        }
      })
    end
  }
}
