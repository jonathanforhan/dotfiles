-- autocmds

vim.api.nvim_create_augroup('AuFormat', {})
vim.api.nvim_create_augroup('AuFiletype', {})
vim.api.nvim_create_augroup('AuCompile', {})

vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'AuFormat',
  command = ':silent lua vim.lsp.buf.format()'
})

vim.api.nvim_create_autocmd('BufRead', {
  group = 'AuFiletype',
  pattern = { '*.vert', '*.frag', '*.tesc', '*.geom', '*.glsl' },
  command = 'setlocal ft=glsl'
})

vim.api.nvim_create_autocmd('Filetype', {
  group = 'AuFiletype',
  pattern = { 'xml', 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'lua', 'haskell' },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2'
})

vim.api.nvim_create_autocmd({ 'BufWritePost', 'Filetype' }, {
  group   = 'AuCompile',
  pattern = '*.tex',
  command = ':silent !pdflatex %:p'
})
