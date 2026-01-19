-- New API config from main
-- WARN: not so stable
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		local ts = require("nvim-treesitter")
--
-- 		local ensure_installed = {
-- 			"lua",
-- 			"vim",
-- 			"vimdoc",
-- 			"c",
-- 			"rust",
-- 			"javascript",
-- 			"typescript",
-- 			"tsx",
-- 			"html",
-- 			"css",
-- 			"json",
-- 			"markdown",
-- 		}
--
-- 		local installed = ts.get_installed()
-- 		local to_install = vim.iter(ensure_installed)
-- 			:filter(function(p)
-- 				return not vim.tbl_contains(installed, p)
-- 			end)
-- 			:totable()
--
-- 		if #to_install > 0 then
-- 			ts.install(to_install)
-- 		end
--
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			pattern = ensure_installed,
-- 			callback = function()
-- 				vim.treesitter.start()
-- 				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 				vim.wo.foldmethod = "expr"
-- 				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 			end,
-- 		})
-- 	end,
-- }

-- Stable API config
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"c",
				"rust",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
