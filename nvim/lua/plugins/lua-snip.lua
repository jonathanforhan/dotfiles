return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  event = "InsertEnter",
  opts = {
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged"
  },
  config = function(_, opts)
    local ls = require("luasnip")

    ls.config.setup(opts)

    vim.keymap.set({ "i", "s" }, "<C-n>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-p>", function() ls.jump(-1) end, { silent = true })
  end
}
