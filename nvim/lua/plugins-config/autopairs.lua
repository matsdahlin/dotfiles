local g = vim.api.nvim_set_var

g('AutoPairsShortcutToggle', '')
g('AutoPairsShortcutFastWrap', '')
g('AutoPairsShortcutJump', '')
g('AutoPairsShortcutBackInsert', '')

return {
 'windwp/nvim-autopairs',
 config = function()
  require('nvim-autopairs').setup()
 end
}
