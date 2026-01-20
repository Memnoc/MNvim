-- set leader key to space
vim.g.mapleader = " "

-- global variable
local map = vim.keymap.set

-- General maps --

-- use jk to exit insert mode
-- map("i", "jk", "<ESC>", { desc = "Exit insert mode with Escape" })

-- delete single character without copying into registster
map("n", "x", '"_x')

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- vertical block selection
map("n", "<leader>vb", "<C-v>G", { desc = "Block select to EOF" })

-- window management
-- map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make splits equal size
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close the active split

-- Window navigation
-- map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
-- map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
-- map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
-- map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })

-- tab management
-- map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- opens a new tab
-- map("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- map("n", "<leader>tl", "<cmd>q<CR>", { desc = "Quit (closes last tab)" })
-- map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- goes to next tab
-- map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- goes to previous tab
-- map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffert in new tab" }) -- moves current buffer to new tab

-- ctrl+s to save
-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
-- map("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file and exit insert" })
-- map("v", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file and exit visual" })

-- Quit all (warns on unsaved)
-- map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

-- Save all and quit
-- map("n", "<leader>qq", "<cmd>wqa<CR>", { desc = "Save all and quit" })

-- Force quit without saving
map("n", "<leader>qQ", "<cmd>qa!<CR>", { desc = "Quit without saving" })

-- Clear search highlights
-- map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Lazy
-- map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

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

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
	require("snacks").bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	require("snacks").bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search on escape
map({ "i", "n", "s" }, "<esc>", function()
	vim.cmd("noh")
	return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Saner behavior of n and N
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save file
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save File" })

-- Keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- Better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Quickfix / Location list
map("n", "<leader>xl", function()
	local win = vim.fn.getloclist(0, { winid = 0 }).winid
	if win ~= 0 then
		vim.cmd.lclose()
	else
		vim.cmd.lopen()
	end
end, { desc = "Toggle Location List" })

map("n", "<leader>xq", function()
	local win = vim.fn.getqflist({ winid = 0 }).winid
	if win ~= 0 then
		vim.cmd.cclose()
	else
		vim.cmd.copen()
	end
end, { desc = "Toggle Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Diagnostic navigation
-- map("n", "]d", function()
-- 	vim.diagnostic.goto_next({ float = true })
-- end, { desc = "Next Diagnostic" })
-- map("n", "[d", function()
-- 	vim.diagnostic.goto_prev({ float = true })
-- end, { desc = "Prev Diagnostic" })
-- map("n", "]e", function()
-- 	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = true })
-- end, { desc = "Next Error" })
-- map("n", "[e", function()
-- 	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = true })
-- end, { desc = "Prev Error" })
-- map("n", "]w", function()
-- 	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN, float = true })
-- end, { desc = "Next Warning" })
-- map("n", "[w", function()
-- 	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN, float = true })
-- end, { desc = "Prev Warning" })

-- Toggle options
-- map("n", "<leader>us", function()
-- 	vim.opt.spell = not vim.opt.spell:get()
-- end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function()
-- 	vim.opt.wrap = not vim.opt.wrap:get()
-- end, { desc = "Toggle Wrap" })
-- map("n", "<leader>uL", function()
-- 	vim.opt.relativenumber = not vim.opt.relativenumber:get()
-- end, { desc = "Toggle Relative Number" })
-- map("n", "<leader>ul", function()
-- 	vim.opt.number = not vim.opt.number:get()
-- end, { desc = "Toggle Line Number" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Inspect
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- Terminal
map("n", "<leader>ft", function()
	require("snacks").terminal()
end, { desc = "Terminal" })
map({ "n", "t" }, "<C-/>", function()
	require("snacks").terminal.toggle()
end, { desc = "Toggle Terminal" })

-- Windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>wm", function()
	require("snacks").toggle.zoom()
end, { desc = "Toggle Zoom" })
map("n", "<leader>uz", function()
	require("snacks").toggle.zen()
end, { desc = "Toggle Zen Mode" })

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
