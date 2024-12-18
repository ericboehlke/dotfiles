return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open lazygit" })
	end,
}
