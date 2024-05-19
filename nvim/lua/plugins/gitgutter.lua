vim.cmd("let g:gitgutter_map_keys = 0")

return {
  "airblade/vim-gitgutter",
  init = function()
    vim.keymap.set("n", "<LEADER>gp", ":GitGutterPreviewHunk<CR>", { desc = "Preview Hunk" })
    vim.keymap.set("n", "<LEADER>gu", ":GitGutterUndoHunk<CR>", { desc = "Undo Hunk" })
    vim.keymap.set("n", "<LEADER>gd", ":GitGutterDiffOrig<CR>", { desc = "Diff" })
  end
}
