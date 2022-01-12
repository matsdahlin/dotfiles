local g = vim.api.nvim_set_var

g('indent_blankline_enabled', 0)

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#282a36 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#22232e gui=nocombine]]

return {
 'lukas-reineke/indent-blankline.nvim',
 config = function()
  require("indent_blankline").setup {
      -- char = "",
      -- char_highlight_list = {
      --     "IndentBlanklineIndent1",
      --     "IndentBlanklineIndent2",
      -- },
      -- space_char_highlight_list = {
      --     "IndentBlanklineIndent1",
      --     "IndentBlanklineIndent2",
      -- },
      -- show_trailing_blankline_indent = false,
      show_current_context = true,
      -- show_current_context_start = true,
  }
 end
}
