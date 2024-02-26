return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cmd = "Copilot",
	config = function()
		local copilot = require("copilot")
		copilot.setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
