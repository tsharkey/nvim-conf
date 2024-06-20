return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local theme = require("lualine.themes.powerline_dark")

        -- set bg transparency in all modes
        theme.normal.c.bg = nil
        theme.insert.c.bg = nil
        theme.visual.c.bg = nil
        theme.replace.c.bg = nil
        theme.command.c.bg = nil

        require("lualine").setup({
            options = {
                theme = theme,
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "diagnostics", "branch" },
                lualine_c = { "diff" },
                lualine_x = { "filename","encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            -- sections = {},
        })
    end
}
