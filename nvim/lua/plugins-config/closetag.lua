local g = vim.api.nvim_set_var

g('closetag_filenames', '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx')
g('closetag_emptyTags_caseSensitive', 1)

return {
 'alvan/vim-closetag'
}
