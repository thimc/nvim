function runBuffer()
	local file_type = vim.bo.filetype
	local file_name = vim.fn.expand('%:t')
	local command = ""

	if file_type == 'c' or file_type == 'h' then
		command = "rm a.out; clang -Wall -g " .. vim.fn.expand('%') .." && ./a.out"
	elseif file_type == 'go' then
		if string.match(file_name, '_test') then
			command = "go test -v . --race -count=1"
		else
			command = "go run " .. vim.fn.expand('%')
		end
	else
		command = "echo 'Unknown filetype'"
	end

	vim.cmd('split')
	vim.cmd('wincmd j')
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(win, buf)
	vim.cmd('term ' .. command)
	vim.cmd('startinsert')
end
vim.keymap.set('n', '<leader>z', runBuffer, {noremap=true})
