local term_opts = { noremap = true, silent = true }
local = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.o.number = true
vim.o.signcolumn = 'yes'

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)


-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap.set('n', '<leader>h', ':nohlsearch<CR>')


keymap.set('n', '<leader>h', ':nohlsearch<CR>')


-- Normal-mode commands
keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- Move lines 
keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
