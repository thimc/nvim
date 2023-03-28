-- -- format the file before saving
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		vim.lsp.buf.format()
-- 	end,
-- })



require('go').setup()
