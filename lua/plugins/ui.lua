return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        opts = {
            -- 💡 设定主题为 darker 变体
            theme = "onedark_dark",
            options = {
                transparent = false,      -- 不透明，确保背景色统一
                terminal_colors = true,   -- 终端颜色同步
                lsp_semantic_highlighting = true, -- 开启 LSP 语义高亮
            },
            -- 💡 颜色微调：避开纯黑，使用高级灰
            colors = {
                onedark_dark = {
                    bg = "#23272e",
                },
            },
            styles = {
                types = "NONE",
                methods = "bold", -- 函数名加粗，适合看大型代码库
                variables = "NONE",
            },
        },
        config = function(_, opts)
            -- 1. 先初始化配置
            require("onedarkpro").setup(opts)
            -- 2. 💡 关键：加载主主题名，它会自动应用上面指定的 darker 变体
            vim.cmd("colorscheme onedark_dark")
        end,
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
