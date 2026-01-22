return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		local virtual_text_enabled = true

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Set keymaps
				keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Go to declaration" })
				)
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "Code actions" })
				)
				keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "Rename symbol" })
				)
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", opts, { desc = "Line diagnostics" })
				)
				keymap.set(
					"n",
					"[d",
					vim.diagnostic.goto_prev,
					vim.tbl_extend("force", opts, { desc = "Prev diagnostic" })
				)
				keymap.set(
					"n",
					"]d",
					vim.diagnostic.goto_next,
					vim.tbl_extend("force", opts, { desc = "Next diagnostic" })
				)
				keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
				keymap.set(
					"n",
					"<leader>rs",
					":LspRestart<CR>",
					vim.tbl_extend("force", opts, { desc = "Restart LSP" })
				)

				keymap.set("n", "<leader>td", function()
					vim.diagnostic.enable(not vim.diagnostic.is_enabled())
				end, { buffer = ev.buf, desc = "Toggle diagnostics" })

				keymap.set("n", "<leader>tv", function()
					virtual_text_enabled = not virtual_text_enabled
					vim.diagnostic.config({ virtual_text = virtual_text_enabled })
				end, { buffer = ev.buf, desc = "Toggle virtual text" })

				-- Register icons with which-key
				local wk_ok, wk = pcall(require, "which-key")
				if wk_ok then
					wk.add({
						{ "gD", buffer = ev.buf, icon = "󰈮" },
						{ "<leader>ca", buffer = ev.buf, icon = "󰌵" },
						{ "<leader>rn", buffer = ev.buf, icon = "󰑕" },
						{ "<leader>d", buffer = ev.buf, icon = "󰨮" },
						{ "[d", buffer = ev.buf, icon = "󰒮" },
						{ "]d", buffer = ev.buf, icon = "󰒭" },
						{ "K", buffer = ev.buf, icon = "󰘥" },
						{ "<leader>rs", buffer = ev.buf, icon = "󰑓" },
						{ "<leader>td", buffer = ev.buf, icon = "󰨚" },
						{ "<leader>tv", buffer = ev.buf, icon = "󰨚" },
					})
				end

				-- Toggle inlay hints
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client and client.supports_method("textDocument/inlayHint") then
					keymap.set("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
					end, { buffer = ev.buf, desc = "Toggle inlay hints" })
					if wk_ok then
						wk.add({ { "<leader>th", buffer = ev.buf, icon = "󰗧" } })
					end
				end

				-- Document highlight on CursorHold
				if client and client.supports_method("textDocument/documentHighlight") then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = ev.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = ev.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(ev2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = ev2.buf })
						end,
					})
				end
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "if_many",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"ts_ls",
				"eslint",
				"tailwindcss",
				"emmet_ls",
			},
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["clangd"] = function()
					lspconfig["clangd"].setup({
						capabilities = capabilities,
						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--header-insertion=iwyu",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--fallback-style=llvm",
						},
						filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
					})
				end,

				["rust_analyzer"] = function()
					lspconfig["rust_analyzer"].setup({
						capabilities = capabilities,
						settings = {
							["rust-analyzer"] = {
								cargo = {
									allFeatures = true,
									loadOutDirsFromCheck = true,
								},
								checkOnSave = {
									command = "clippy",
								},
								procMacro = {
									enable = true,
								},
							},
						},
					})
				end,

				["ts_ls"] = function()
					lspconfig["ts_ls"].setup({
						capabilities = capabilities,
						settings = {
							typescript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
								},
							},
							javascript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
								},
							},
						},
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
						},
					})
				end,

				["eslint"] = function()
					lspconfig["eslint"].setup({
						capabilities = capabilities,
						on_attach = function(_, bufnr)
							vim.api.nvim_create_autocmd("BufWritePre", {
								buffer = bufnr,
								command = "EslintFixAll",
							})
						end,
					})
				end,

				["tailwindcss"] = function()
					lspconfig["tailwindcss"].setup({
						capabilities = capabilities,
						filetypes = { "html", "javascriptreact", "typescriptreact", "svelte" },
					})
				end,

				["emmet_ls"] = function()
					lspconfig["emmet_ls"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,

				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
			},
		})
	end,
}
