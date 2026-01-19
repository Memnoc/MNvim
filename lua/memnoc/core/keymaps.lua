-- set leader key to space
vim.g.mapleader = " "

-- global variable
local keymap = vim.keymap

-- General Keymaps --

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with Escape" })

-- delete single character without copying into registster
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- vertical block selection
vim.keymap.set("n", "<leader>vb", "<C-v>G", { desc = "Block select to EOF" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make splits equal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close the active split

-- Window navigation
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- opens a new tab
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tl", "<cmd>q<CR>", { desc = "Quit (closes last tab)" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- goes to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- goes to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffert in new tab" }) -- moves current buffer to new tab

-- ctrl+s to save
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file and exit insert" })
keymap.set("v", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file and exit visual" })

-- Quit all (warns on unsaved)
keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

-- Save all and quit
keymap.set("n", "<leader>qq", "<cmd>wqa<CR>", { desc = "Save all and quit" })

-- Force quit without saving
keymap.set("n", "<leader>qQ", "<cmd>qa!<CR>", { desc = "Quit without saving" })

-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Lazy
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
