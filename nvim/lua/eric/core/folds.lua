function _G.set_erics_custom_fold(string_to_match, should_match)
	-- Define the fold expression function
	if should_match then
		print("Folding all lines that contain: " .. string_to_match)
		_G.erics_custom_fold_expr = function(lnum)
			local line = vim.fn.getline(lnum)
			if string.find(line, string_to_match) then
				return "1"
			else
				return "0"
			end
		end
	else
		print("Folding lines that don't contain: " .. string_to_match)
		_G.erics_custom_fold_expr = function(lnum)
			local line = vim.fn.getline(lnum)
			if not string.find(line, string_to_match) then
				return "1"
			else
				return "0"
			end
		end
	end

	-- Set foldmethod to 'expr' and foldexpr to the custom fold expression
	vim.wo.foldmethod = "expr"
	vim.wo.foldexpr = "v:lua.erics_custom_fold_expr(v:lnum)"
end

vim.api.nvim_create_user_command("FoldNot", function(opts)
	set_erics_custom_fold(opts.fargs[1], false)
end, { nargs = 1 })

vim.api.nvim_create_user_command("FoldAll", function(opts)
	set_erics_custom_fold(opts.fargs[1], true)
end, { nargs = 1 })

vim.api.nvim_create_user_command("FoldOff", function(opts)
	vim.wo.foldmethod = "expr"
	vim.wo.foldexpr = 0
end, { nargs = 0 })
