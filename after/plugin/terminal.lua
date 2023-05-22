_G.terminal_buf = nil
_G.terminal_win = nil
_G.terminal_pid = nil
_G.terminal_shell = nil
function toggleTerminal()
	if _G.terminal_win and vim.api.nvim_win_is_valid(_G.terminal_win) then
		-- hide the terminal if it's visible
		vim.api.nvim_win_close(_G.terminal_win, true)
		_G.terminal_win = nil
	else
		if _G.terminal_buf and vim.api.nvim_buf_is_valid(_G.terminal_buf) then
			-- it exists but isn't visible
			vim.api.nvim_command('belowright split')
			local term_win = vim.api.nvim_get_current_win()
			vim.api.nvim_win_set_buf(term_win, _G.terminal_buf)
			_G.terminal_win = term_win
		else
			-- create a new terminal buffer
			vim.api.nvim_command('belowright split | terminal')
			_G.terminal_buf = vim.api.nvim_get_current_buf()
			_G.terminal_win = vim.api.nvim_get_current_win()
			local buf_name = string.reverse(vim.api.nvim_buf_get_name(_G.terminal_buf))
			local pid = buf_name:match(":(%d+)")
			local shell_name = buf_name:match("(.-):")
			if pid then
				_G.terminal_pid = string.reverse(pid)
			end
			if shell_name then
				_G.terminal_shell = string.reverse(shell_name)
			end
		end
		-- set the title and start the buffer in insert mode
		vim.api.nvim_buf_set_name(_G.terminal_buf, _G.terminal_shell .. ' pid:' .. _G.terminal_pid)
		vim.api.nvim_command('startinsert')
	end
end

vim.keymap.set('n', '<leader>t', toggleTerminal, {noremap=true, silent=true})

