return { 
    {
        "EdenEast/nightfox.nvim",
        lazy = false, -- sets the active theme
        config = function ()
            -- vim.cmd("colorscheme nordfox")
            -- vim.cmd("colorscheme nightfox")
            vim.cmd("colorscheme terafox")
        end
    },
    { 
        'shaunsingh/nord.nvim',
        name = "nord",
        config = function ()
            vim.cmd("colorscheme nord")
        end
    }
}
