return {

    {
        "akinsho/toggleterm.nvim",
        version = "*",

        config = function()

            require("toggleterm").setup({
                size = 15,
                open_mapping = [[<c-\>]],
                direction = "float",
                shade_terminals = true,
            })

        end,
    },

}
