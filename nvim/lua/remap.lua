local builtin = require('telescope.builtin')
local function any_dir(fn)
  fn({ search_dirs = { vim.fn.input('Directory: ', '', 'file') } })
end

-- buffer-navigation
vim.keymap.set('n', '<LEADER>p', '<CMD>b#<CR>')
vim.keymap.set('n', '<LEADER>b', builtin.buffers)
vim.keymap.set('n', '<LEADER>f', builtin.find_files)
vim.keymap.set('n', '<LEADER>g', builtin.git_files)
vim.keymap.set('n', '<LEADER>o', builtin.oldfiles)
vim.keymap.set('n', '<LEADER>s', builtin.live_grep)
vim.keymap.set('n', '<LEADER>F', function() any_dir(builtin.find_files) end)
vim.keymap.set('n', '<LEADER>S', function() any_dir(builtin.live_grep) end)
vim.keymap.set('n', '<LEADER>t', require('trouble').toggle)
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- git
vim.keymap.set('n', '<LEADER>G', '<CMD>GitGutterPreviewHunk<CR>')

-- cpp
vim.keymap.set({ 'n', 'v' }, '<LEADER>m', '<CMD>TSCppDefineClassFunc<CR><CMD>ClangdSwitchSourceHeader<CR>')
vim.keymap.set({ 'n', 'v' }, '<LEADER>M', '<CMD>TSCppDefineClassFunc<CR>')
vim.keymap.set('n', '<LEADER>h', '<CMD>ClangdSwitchSourceHeader<CR>')

-- lsp
vim.keymap.set('n', '<LEADER>a', vim.lsp.buf.code_action)
vim.keymap.set('n', '<LEADER>r', vim.lsp.buf.rename)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

-- glyphs
vim.keymap.set('i', '<C-k>', function()
  require('nvim-glyph').pick_glyph()
end)

vim.keymap.set('n', 'Q', '<NOP>')
