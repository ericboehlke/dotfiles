return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "black" },
				json = { "jq" },
			},
			-- Use this to debug issues.
			-- log_level = vim.log.levels.DEBUG,
			format_on_save = {
				-- These options will be passed to conform.format()
				async = false,
				timeout_ms = 1000,
				lsp_fallback = true,
			},
			formatters = {
				black = {
					prepend_args = {
						{ "--line-length", "100" },
					},
				},
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({

				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
	opts = {},
}
