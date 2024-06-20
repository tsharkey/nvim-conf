return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function ()
        vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
        vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })
    end
}
