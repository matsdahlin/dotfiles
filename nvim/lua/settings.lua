local set = vim.opt

vim.cmd[[language en_US]]
set.fileencoding = 'utf-8'

vim.cmd[[colorscheme dracula]]

set.expandtab = true
-- set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

-- set.autoindent = true
-- set.smartindent  = true
-- set.cindent = true -- like smartindent but stricter

set.hidden = true
-- number column
set.number = true
set.relativenumber = false
set.signcolumn = 'yes:2'

set.termguicolors = true
set.undofile = true
set.title = true

-- search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.showmatch = true

set.wrap = false
set.list = true
set.listchars = { tab = '▶ ', trail = '∙' }
set.mouse = 'a'
set.scrolloff = 8
set.sidescrolloff = 8
set.joinspaces = false
set.splitright = true
set.splitbelow = true
set.clipboard = 'unnamedplus'
set.confirm = true
set.exrc = true
set.backup = true
set.backupdir = vim.fn.stdpath('config') .. '/backup'
set.updatetime = 300 -- Reduce time for highlighting other references
set.redrawtime = 10000 -- Allow more time for loading syntax on large files
-- Highlight current line
set.cursorline = true
set.visualbell = true

set.visualbell = true

set.completeopt = {'menuone', 'noinsert', 'noselect'}

-- set.spell = true
-- set wildmode=longest:full,full
vim.cmd [[ highlight cursorline guibg=#242633 ]]
vim.cmd [[ highlight cursorlinenr guibg=#242633 ]]

local signs = {
        Error = "",
        Warn = "",
        Hint = "",
        Info = "",
    }

for type, icon in pairs(signs) do

  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
