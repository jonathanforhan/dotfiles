-- autocmds
vim.api.nvim_create_autocmd('BufWrite', {
  callback = function()
    vim.lsp.buf.format()
  end
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = { '*.vert', '*.frag', '*.tesc', '*.geom', '*.glsl' },
  command = 'setlocal ft=glsl'
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = { 'xml', 'html', 'css', 'javascript', 'typescript', 'jsx', 'tsx', 'lua', 'haskell' },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2'
})

vim.api.nvim_create_autocmd({ 'BufWritePost', 'Filetype' }, {
  pattern = '*.tex',
  command = ':silent !pdflatex %:p'
})
