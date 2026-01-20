return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local colors = {
			blue = "#7aa2f7",
			cyan = "#7dcfff",
			green = "#9ece6a",
			magenta = "#bb9af7",
			orange = "#ff9e64",
			red = "#f7768e",
			yellow = "#e0af68",
			fg = "#c0caf5",
			bg = "#1a1b26",
			inactive_bg = "#16161e",
			inactive_fg = "#565f89",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.magenta, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.inactive_fg, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.inactive_fg },
				c = { bg = colors.inactive_bg, fg = colors.inactive_fg },
			},
		}

		lualine.setup({
			options = {
				theme = my_lualine_theme,
				disabled_filetypes = {
					statusline = { "snacks_layout_box", "snacks_picker_input", "snacks_dashboard" },
				},
				globalstatus = true,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.orange },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
