return {

    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,

        config = function()
            vim.cmd("colorscheme onedark")
        end
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },

}
