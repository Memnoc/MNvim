return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-- Explorer
		{
			"<leader>e",
			function()
				require("snacks").explorer()
			end,
			desc = "File Explorer",
		},

		-- Files
		{
			"<leader>ff",
			function()
				require("snacks").picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fr",
			function()
				require("snacks").picker.recent()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fc",
			function()
				require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Config Files",
		},
		{
			"<leader>fb",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader><leader>",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Buffers",
		},

		-- Search
		{
			"<leader>sg",
			function()
				require("snacks").picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				require("snacks").picker.grep_word()
			end,
			desc = "Grep Word",
		},
		{
			"<leader>sb",
			function()
				require("snacks").picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sh",
			function()
				require("snacks").picker.help()
			end,
			desc = "Help",
		},
		{
			"<leader>sk",
			function()
				require("snacks").picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sd",
			function()
				require("snacks").picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>ss",
			function()
				require("snacks").picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				require("snacks").picker.lsp_workspace_symbols()
			end,
			desc = "Workspace Symbols",
		},
		{
			"<leader>sr",
			function()
				require("snacks").picker.resume()
			end,
			desc = "Resume Last",
		},
		{
			"<leader>s/",
			function()
				require("snacks").picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>/",
			function()
				require("snacks").picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sn",
			function()
				require("noice").cmd("history")
			end,
			desc = "Noice History",
		},

		-- Git
		{
			"<leader>gg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gf",
			function()
				require("snacks").lazygit.log_file()
			end,
			desc = "File Log",
		},
		{
			"<leader>gl",
			function()
				require("snacks").picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gs",
			function()
				require("snacks").picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gb",
			function()
				require("snacks").picker.git_branches()
			end,
			desc = "Git Branches",
		},

		-- LSP
		{
			"gd",
			function()
				require("snacks").picker.lsp_definitions()
			end,
			desc = "Go to Definition",
		},
		{
			"gr",
			function()
				require("snacks").picker.lsp_references()
			end,
			desc = "References",
		},
		{
			"gI",
			function()
				require("snacks").picker.lsp_implementations()
			end,
			desc = "Implementations",
		},
		{
			"gy",
			function()
				require("snacks").picker.lsp_type_definitions()
			end,
			desc = "Type Definitions",
		},

		-- Notifications
		{
			"<leader>un",
			function()
				require("snacks").notifier.hide()
			end,
			desc = "Dismiss Notifications",
		},
		{
			"<leader>nh",
			function()
				require("snacks").notifier.show_history()
			end,
			desc = "Notification History",
		},

		-- Word navigation
		{
			"]]",
			function()
				require("snacks").words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
		},
		{
			"[[",
			function()
				require("snacks").words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
		},
	},
	opts = {
		bigfile = { enabled = true },
		explorer = { enabled = true, replace_netrw = true },
		indent = {
			enabled = true,
			char = "│",
		},
		input = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		words = { enabled = true },
		lazygit = { enabled = true },
	},
}
