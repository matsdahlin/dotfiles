local let = vim.g
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

let.mapleader = " "

-- clear search highlighting
map('n', '<leader>k', ':nohl<CR>', default_opts)
--
-- fast saving with <leader> and s
map('n', '<leader>s', ':w<cr>', default_opts)
--map('i', '<leader>s', '<c-c>:w<cr>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- resize splits
map('n', '<leader>wh', '<C-w>10<', default_opts)
map('n', '<leader>wl', '<C-w>10>', default_opts)
map('n', '<leader>wk', '<C-w>+', default_opts)
map('n', '<leader>wj', '<C-w>-', default_opts)

-- quick fix list
map('n', '<leader>qk', ':cprev<CR>', default_opts)
map('n', '<leader>qj', ':cnext<CR>', default_opts)
map('n', '<leader>qc', ':cclose<CR>', default_opts)

-- toggle indentation markers
map('n', '<leader>il', ':IndentBlanklineToggle<CR>', default_opts)

-- file explorer
map('n', '<leader>B', ':NvimTreeToggle<CR>', default_opts)

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

-- nvim-cmp
-- Use <Tab> and <S-Tab> to navigate through popup menu
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', default_opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', default_opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', default_opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', default_opts)

-- fugitive
map('n', '<leader>ga', ':Git add %:p<CR><CR>', default_opts)
map('n', '<leader>gs', ':Git<CR>', default_opts)
map('n', '<leader>gc', ':Git commit<CR>', default_opts)
map('n', '<leader>gd', ':Git diff<CR>', default_opts)
map('n', '<leader>ge', ':Gedit<CR>', default_opts)
map('n', '<leader>gb', ':Git branch<CR>', default_opts)
map('n', '<leader>go', ':Git checkout<CR>', default_opts)
map('n', '<leader>gds', ':Git! diff --staged<CR>', default_opts)

-- vim-test
map('n', '<leader>tn', ':TestNearest<CR>', default_opts)
map('n', '<leader>tf', ':TestFile<CR>', default_opts)
map('n', '<leader>ta', ':TestSuite<CR>', default_opts)
map('n', '<leader>tl', ':TestLast<CR>', default_opts)
map('n', '<leader>tv', ':TestVisit<CR>', default_opts)
