return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local wk = require("which-key")

		wk.setup({
			delay = 300,
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			win = {
				border = "rounded",
				padding = { 1, 2 },
			},
			layout = {
				spacing = 3,
			},
		})

		wk.add({
			{ "<leader>b", group = "buffer", icon = "󰖲 " },
			{ "<leader>c", group = "code", icon = "󰈮 " },
			{ "<leader>f", group = "file/find", icon = "󰮗 " },
			-- { "<leader>g", group = "git", icon = "" },
			{ "<leader>q", group = "quit/session", icon = "󰗼 " },
			{ "<leader>s", group = "search", icon = " " },
			{ "<leader>t", group = "toggle", icon = " " },
			{ "<leader>u", group = "ui", icon = " " },
			{ "<leader>w", group = "window", icon = " " },
			{ "<leader>x", group = "diagnostics", icon = "󰩂 " },
			-- { "<leader><tab>", group = "tabs", icon = " " },
		})
	end,
}
