vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true

vim.opt.smartindent=true
vim.opt.autoindent=true

vim.opt.showmatch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true

--vim.opt.autoload=true
vim.opt.wildmode={ 'longest', 'list' }

vim.opt.number=true
--vim.opt.relativenumber=true

vim.g.mapleader = " "

-- Copy relative filepath to system buffer
--vim.keymap.set('<leader>g%' ':let @+=expand("%")<CR>')

-- Copy selection into system copy buffer
vim.keymap.set('v', '<leader>x', '"*y')

-- Pane navigation
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set('t', '<A-[>', '<C-\\><C-n>')

vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

require('plugins')

vim.keymap.set('n', '<leader><Tab>', '<cmd>Ex<cr>')
vim.keymap.set('n', '<leader>`', '<cmd>60split<cr><C-w>j<cmd>terminal<cr>')
