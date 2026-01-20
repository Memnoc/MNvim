-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- C compilation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.bo.makeprg = "gcc %:p -o %:p:r -Wall -Wextra"

		vim.keymap.set("n", "<leader>cc", "<cmd>make<CR>", { buffer = true, desc = "Compile C" })

		vim.keymap.set("n", "<leader>cr", function()
			local out = vim.fn.expand("%:p:r")
			vim.cmd('botright 15split | terminal bash -c "' .. out .. ' ; echo ; echo [Press ENTER to close] ; read"')
		end, { buffer = true, desc = "Run C" })

		vim.keymap.set("n", "<leader>cx", function()
			local out = vim.fn.expand("%:p:r")
			vim.cmd("make")
			vim.cmd('botright 15split | terminal bash -c "' .. out .. ' ; echo ; echo [Press ENTER to close] ; read"')
		end, { buffer = true, desc = "Compile and run C" })
	end,
})

-- Rust compilation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		vim.bo.makeprg = "cargo build"
		vim.keymap.set("n", "<leader>cc", "<cmd>make<CR>", { buffer = true, desc = "Cargo build" })
		vim.keymap.set("n", "<leader>cr", "<cmd>!cargo run<CR>", { buffer = true, desc = "Cargo run" })
		vim.keymap.set("n", "<leader>ct", "<cmd>!cargo test<CR>", { buffer = true, desc = "Cargo test" })
	end,
})
