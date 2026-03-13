return {

    {
        "nvim-telescope/telescope.nvim",
        version = "*",

        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },

        config = function()

            local telescope = require("telescope")

            telescope.setup({})

            -- 加载 fzf 扩展
            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")

            -- 常用快捷键
            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<leader>fh", builtin.help_tags)

        end,
    },

}
