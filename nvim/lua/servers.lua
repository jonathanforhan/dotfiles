local lsp_config = require("lspconfig")
local util = lsp_config.util

lsp_config.svls.setup({
  root_dir = util.root_pattern(".svls.toml", ".git")
})
