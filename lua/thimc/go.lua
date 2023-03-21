local ok, gopher = pcall(require, 'gopher')

if ok then
	gopher.setup {
	  commands = {
	    go = "go",
	    gomodifytags = "gomodifytags",
	    gotests = "gotests",
	    impl = "impl",
	    iferr = "iferr",
	  },
	}

	function GoRun(...)
		local args = table.concat({...}, " ")
		if args == "" then
			args = vim.fn.expand('%')
		end
		local qargs = '"' .. args:gsub('"', '\\"') .. '"'
		local cmd = "!go run " ..  qargs
		vim.cmd(cmd)
	end
	vim.cmd("command! -nargs=* GoRun lua GoRun(<f-args>)")

	local bind = vim.keymap.set
	bind('n', '<leader>xg', "<cmd>GoRun<CR>")
end
