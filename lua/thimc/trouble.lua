-- settings without a patched font or icons
local ok, trouble = pcall(require, 'trouble')

if ok then
	trouble.setup {
		icons = false,
		fold_open = "v", -- icon used for open folds
		fold_closed = ">", -- icon used for closed folds
		indent_lines = false, -- add an indent guide below the fold icons
		signs = {
			-- icons / text used for a diagnostic
			error = "E",
			warning = "W",
			hint = "H",
			information = "I",
			other = "O"
		},
		-- enabling this will use the signs defined in your lsp client
		diagnostic_signs = false
	}
end
