-- SQL
vim.api.nvim_create_augroup("format_sql", { clear = true })

-- Run pgformatter on write for SQL files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.sql",
	command = "silent! !pg_format -i %",
	group = "format_sql",
})

-- Golang
-- vim.api.nvim_create_augroup("format_go", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = "*.go,go.mod",
-- 	command = "silent! !goimports -w %",
--     group = "format_go"
-- })

-- Templ
vim.api.nvim_create_augroup("format_templ", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.templ" },
    command = "silent! !templ fmt %",
    group = "format_templ"
})
