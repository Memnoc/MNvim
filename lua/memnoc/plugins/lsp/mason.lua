return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- TypeScript / React
				"ts_ls",
				"eslint",
				"tailwindcss",
				"emmet_ls",

				-- Rust
				"rust_analyzer",

				-- C / C++
				"clangd",

				-- Web
				"html",
				"cssls",
				"svelte",
				"graphql",
				"prismals",

				-- Lua
				"lua_ls",

				-- Python
				"pyright",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters
				"clang-format", -- C/C++
				"prettier", -- JS/TS/Web
				"stylua", -- Lua
				"isort", -- Python
				"black", -- Python

				-- Linters
				"eslint_d", -- JS/TS (faster eslint)
				"cpplint", -- C and C++
				"pylint", -- Python
			},
		})
	end,
}
