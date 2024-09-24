local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

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

keymap('n', '<leader>h', ':nohlsearch<CR>', opts)


-- Normal-mode commands
keymap('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
keymap('n', '<A-j>', ':MoveLine(1)<CR>', opts)
keymap('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
keymap('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
keymap('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
keymap('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Vismode commands
keymap('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
keymap('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
keymap('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
keymap('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- Movnes 
keymap("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
keymap("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
