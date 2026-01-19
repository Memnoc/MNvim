-- vertical Explorer
vim.cmd("let g:netrw_liststyle=3")

-- global variable
local opt = vim.opt

-- timeoutlen
opt.timeoutlen = 200

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaced for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- disable line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- highlight line under cursor
opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- all colorscheme will be dark
opt.signcolumn = "yes" -- show sign column so that text does not shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position


-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register


-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- spit horizonatal window at the bootom


-- turn off swapfile
opt.swapfile = false

-- startofline
opt.startofline = false
opt.virtualedit = "block"
