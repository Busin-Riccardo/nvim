-- SETTINGS
vim.opt.guicursor = ""

-- leader key
vim.g.mapleader = " "

-- removes fixed bottom line used to show current command
vim.opt.cmdheight = 0

-- always yank to * register
vim.opt.clipboard = "unnamed"

-- lines numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3

-- search highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indent
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

