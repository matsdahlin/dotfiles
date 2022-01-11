local let = vim.g
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

let.mapleader = " "

-- clear search highlighting
map('n', '<leader>k', ':nohl<CR>', default_opts)

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<cr>', default_opts)
map('i', '<leader>s', '<c-c>:w<cr>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- quick fix list
map('n', '<leader>qk', ':cnext<CR>', default_opts)
map('n', '<leader>qj', ':cnext<CR>', default_opts)

-- toggle indentation markers
map('n', '<leader>il', ':IndentBlanklineToggle<CR>', default_opts)

-- allow gf to open non-existant files
map('n', 'gf', ':edit <cfile><CR>', default_opts)

-- reselect visual selection after indenting
map('v', '<', '<gv', default_opts)
map('v', '>', '>gv', default_opts)

-- open current file in the default program (ie opening html files in browser)
map('n', '<leader>x', ':!open %<CR><CR>', default_opts)

-- easy insertion of a trailing ; or , when in insert mode
map('i', ';;', '<ESC>A;<ESC>', default_opts)
map('i', ',,', '<ESC>A,<ESC>', default_opts)

-- move line up / down
map('n', '<leader>J', ':m .+1<CR>==', default_opts)
map('n', '<leader>K', ':m .-2<CR>==', default_opts)

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', default_opts)  
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', default_opts)  
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', default_opts)  
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', default_opts)  
