local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.shellcheck,

		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.eslint,

		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.tags,

		null_ls.builtins.hover.dictionary,
	},
})
