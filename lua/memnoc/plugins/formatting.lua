return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- Track format on save state
		vim.g.format_on_save_enabled = true

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = function()
				if not vim.g.format_on_save_enabled then
					return nil
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				}
			end,
		})

		-- Manual format if needed
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range" })

		-- Toggle format on save
		vim.keymap.set("n", "<leader>tf", function()
			vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
			if vim.g.format_on_save_enabled then
				vim.notify("Format on save enabled", vim.log.levels.INFO)
			else
				vim.notify("Format on save disabled", vim.log.levels.INFO)
			end
		end, { desc = "Toggle format on save" })
	end,
}
