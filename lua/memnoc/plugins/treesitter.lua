return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}

-- NOTE: new API with autoinstall
-- return {
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		branch = "main",
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			-- main branch setup() is minimal - only install_dir option
-- 			require("nvim-treesitter").setup({})
-- 		end,
-- 	},
-- 	{
-- 		"mks-h/treesitter-autoinstall.nvim",
-- 		dependencies = { "nvim-treesitter/nvim-treesitter" },
-- 		config = function()
-- 			require("treesitter-autoinstall").setup({
-- 				highlight = true,
-- 				ignore = {
-- 					"snacks_notif",
-- 					"snacks_picker_preview",
-- 					"snacks_picker_input",
-- 					"snacks_picker_list",
-- 					"snacks_dashboard",
-- 					"snacks_terminal",
-- 					"snacks_layout_box",
-- 					"snacks_win_backdrop",
-- 					"cmp_docs",
-- 					"snacks_win",
-- 					"lazy",
-- 					"mason",
-- 					"TelescopePrompt",
-- 					"TelescopeResults",
-- 					"NvimTree",
-- 					"neo-tree",
-- 					"oil",
-- 					"help",
-- 					"checkhealth",
-- 					"qf",
-- 					"noice",
-- 					"toggleterm",
-- 				},
-- 			})
-- 		end,
-- 	},
-- }

-- WARN: OLD Stable API config
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	branch = "master",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		require("nvim-treesitter.configs").setup({
-- 			ensure_installed = {
-- 				"lua",
-- 				"vim",
-- 				"vimdoc",
-- 				"c",
-- 				"rust",
-- 				"javascript",
-- 				"typescript",
-- 				"tsx",
-- 				"html",
-- 				"css",
-- 				"json",
-- 			},
-- 			auto_install = true,
-- 			highlight = { enable = true },
-- 			indent = { enable = true },
-- 		})
-- 	end,
-- }
