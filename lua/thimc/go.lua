local bind = vim.keymap.set
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

	require("gopher.dap").setup() -- needs nvim-dap and `dlv` installed
	-- keybinds for debugging (see :help dap-mappings)
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)

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

	bind('n', '<leader>xg', ":GoRun<space>.")
end
