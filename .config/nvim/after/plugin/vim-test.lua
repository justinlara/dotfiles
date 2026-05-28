-- Fix for readline issue with binding.pry
vim.g['test#ruby#rspec#executable'] = 'RUBYOPT="-W0" bundle exec rspec'
vim.g['test#javascript#jest#executable'] = 'pnpm jest'

vim.g['test#strategy'] = "neovim"

vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>')

-- Allow using escape to move to command mode in terminal and scroll upwards
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
