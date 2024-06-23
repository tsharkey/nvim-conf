return {
    'stevearc/aerial.nvim',
    opts = {},
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        require("aerial").setup({ })
        vim.keymap.set("n", "<leader>aa", "<cmd>Telescope aerial<CR>")
    end
}
