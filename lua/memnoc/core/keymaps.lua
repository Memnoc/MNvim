-- set leader key to space
vim.g.mapleader = " "

-- global variable
local map = vim.keymap.set

---------------------
-- Visual
---------------------
map("n", "<leader>vb", "<C-v>G", { desc = "Block select to EOF" })

---------------------
-- Window management
---------------------
map("n", "<leader>we", "<C-w>=", { desc = "Equal size" })
map("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close split" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize toggle" })
map("n", "<leader>|", "<C-W>s", { desc = "Split below" })
map("n", "<leader>-", "<C-W>v", { desc = "Split right" })

---------------------
-- Quit/Session
---------------------
map("n", "<leader>qQ", "<cmd>qa!<CR>", { desc = "Quit without saving" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

---------------------
-- Terminal
---------------------
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

---------------------
-- Movement (no leader)
---------------------
-- Better up/down (handles wrapped lines)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

---------------------
-- Buffer
---------------------
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete buffer and window" })

---------------------
-- Search/Clear
---------------------
-- Clear search on escape
map({ "i", "n", "s" }, "<esc>", function()
	vim.cmd("noh")
	return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Saner behavior of n and N
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

---------------------
-- UI
---------------------
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / Clear hlsearch" })
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

---------------------
-- Editing helpers (no leader)
---------------------
-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save file
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save File" })

-- Better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

---------------------
-- Misc leader keys
---------------------
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

---------------------
-- File
---------------------
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

---------------------
-- Snacks Terminal
---------------------
map("n", "<leader>ft", function()
	require("snacks").terminal()
end, { desc = "Terminal" })

map({ "n", "t" }, "<C-/>", function()
	require("snacks").terminal.toggle()
end, { desc = "Toggle Terminal" })
