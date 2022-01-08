
local set = vim.opt

vim.cmd 'language en_US'
set.fileencoding = 'utf-8'

set.expandtab = true
-- set.smarttab = true

set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

set.hidden = true
-- number column
set.number = true
set.relativenumber = true
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
set.backupdir = '$HOME/.config/nvim/backup/'
set.updatetime = 300 -- Reduce time for highlighting other references
set.redrawtime = 10000 -- Allow more time for loading syntax on large files
-- Highlight current line
set.cursorline = true
set.visualbell = true
set.autoindent = true


-- set.spell = true
-- set wildmode=longest:full,full