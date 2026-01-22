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
			-- =====================
			-- GROUPS
			-- =====================
			{ "<leader>b", group = "buffer", icon = "󰖲" },
			{ "<leader>c", group = "code", icon = "󰈮" },
			{ "<leader>f", group = "file/find", icon = "󰮗" },
			{ "<leader>g", group = "git", icon = "" },
			{ "<leader>i", group = "icons", icon = "" },
			{ "<leader>m", group = "markdown", icon = "" },
			{ "<leader>n", group = "notifications", icon = "󰂚" },
			{ "<leader>q", group = "quit/session", icon = "󰗼" },
			{ "<leader>r", group = "refactor", icon = "󰑕" },
			{ "<leader>s", group = "search", icon = "" },
			{ "<leader>t", group = "toggle", icon = "" },
			{ "<leader>u", group = "ui", icon = "" },
			{ "<leader>v", group = "visual", icon = "󰒉" },
			{ "<leader>w", group = "window", icon = "" },
			{ "<leader>x", group = "diagnostics", icon = "󰩂" },

			-- =====================
			-- DIRECT KEYMAPS (no subgroup)
			-- =====================
			{ "<leader>e", icon = "󰙅" },
			{ "<leader>d", icon = "󰨮" },
			{ "<leader>l", icon = "󰒲" },
			{ "<leader>K", icon = "󰘥" },
			{ "<leader>9", icon = "" },
			{ "<leader><leader>", icon = "󰈔" },
			{ "<leader>|", icon = "󰤼" },
			{ "<leader>-", icon = "󰤻" },
			{ "<leader>/", icon = "󰍉" },

			-- =====================
			-- BUFFER
			-- =====================
			{ "<leader>bp", icon = "󰐃" },
			{ "<leader>bx", icon = "󰅖" },
			{ "<leader>bd", icon = "󰅖" },
			{ "<leader>bD", icon = "󰅖" },

			-- =====================
			-- CODE
			-- =====================
			{ "<leader>ca", icon = "󰌵" },
			{ "<leader>cf", icon = "󰉼" },
			{ "<leader>ci", icon = "󰏷" },
			{ "<leader>co", icon = "󰏻" },
			{ "<leader>cs", icon = "󰒓" },
			-- =====================
			-- FILE/FIND
			-- =====================
			{ "<leader>ff", icon = "󰈞" },
			{ "<leader>fr", icon = "󰋚" },
			{ "<leader>fc", icon = "󰒓" },
			{ "<leader>fb", icon = "󰈔" },
			{ "<leader>fn", icon = "󰈔" },
			{ "<leader>ft", icon = "" },

			-- =====================
			-- GIT
			-- =====================
			{ "<leader>gg", icon = "󰊢" },
			{ "<leader>gf", icon = "󰊢" },
			{ "<leader>gl", icon = "󰋚" },
			{ "<leader>gs", icon = "󱖫" },
			{ "<leader>gb", icon = "" },

			-- =====================
			-- ICONS
			-- =====================
			{ "<leader>ip", icon = "" },
			{ "<leader>iy", icon = "󰆏" },

			-- =====================
			-- MARKDOWN
			-- =====================
			{ "<leader>mp", icon = "" },

			-- =====================
			-- NOTIFICATIONS
			-- =====================
			{ "<leader>nh", icon = "󰂚" },
			{ "<leader>na", icon = "󰂚" },
			{ "<leader>nd", icon = "󰂛" },

			-- =====================
			-- QUIT/SESSION
			-- =====================
			{ "<leader>qq", icon = "󰗼" },
			{ "<leader>qQ", icon = "󰗼" },

			-- =====================
			-- REFACTOR
			-- =====================
			{ "<leader>rn", icon = "󰑕" },
			{ "<leader>rs", icon = "󰑓" },

			-- =====================
			-- SEARCH
			-- =====================
			{ "<leader>sg", icon = "󰈬" },
			{ "<leader>sw", icon = "󰗧" },
			{ "<leader>sb", icon = "󰍉" },
			{ "<leader>sh", icon = "󰋖" },
			{ "<leader>sk", icon = "󰌌" },
			{ "<leader>sd", icon = "󰒡" },
			{ "<leader>ss", icon = "󰒕" },
			{ "<leader>sS", icon = "󰒕" },
			{ "<leader>sr", icon = "󰑓" },
			{ "<leader>s/", icon = "󰈬" },
			{ "<leader>sn", icon = "󰂚" },

			-- =====================
			-- TOGGLE
			-- =====================
			{ "<leader>td", icon = "󰨚" },
			{ "<leader>tv", icon = "󰨚" },
			{ "<leader>th", icon = "󰗧" },

			-- =====================
			-- UI
			-- =====================
			{ "<leader>ui", icon = "" },
			{ "<leader>ur", icon = "󰑓" },
			{ "<leader>un", icon = "󰂛" },

			-- =====================
			-- VISUAL
			-- =====================
			{ "<leader>vb", icon = "󰒉" },

			-- =====================
			-- WINDOW
			-- =====================
			{ "<leader>we", icon = "󰕮" },
			{ "<leader>wx", icon = "󰅖" },
			{ "<leader>wd", icon = "󰅖" },
			{ "<leader>wm", icon = "󰁌" },

			-- =====================
			-- DIAGNOSTICS (trouble)
			-- =====================
			{ "<leader>xx", icon = "󰒡" },
			{ "<leader>xd", icon = "󰈙" },
			{ "<leader>xq", icon = "󰁨" },
			{ "<leader>xl", icon = "󰋚" },
			{ "<leader>xt", icon = "󰄬" },

			-- =====================
			-- GO-TO (non-leader)
			-- =====================
			{ "gd", icon = "󰈮" },
			{ "gD", icon = "󰈮" },
			{ "gr", icon = "󰈇" },
			{ "gI", icon = "󰡱" },
			{ "gy", icon = "󰊄" },
			{ "K", icon = "󰘥" },
			{ "[d", icon = "󰒮" },
			{ "]d", icon = "󰒭" },
			{ "[[", icon = "󰒮" },
			{ "]]", icon = "󰒭" },
		})
	end,
}
