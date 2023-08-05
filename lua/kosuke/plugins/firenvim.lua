vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = "qiita.com_*.txt",
    command = "set filetype=markdown"
})
