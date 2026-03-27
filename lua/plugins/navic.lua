return {
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return {
                highlight = true,
                separator = "  ", -- 使用更精致的符号
                depth_limit = 0,
                depth_limit_indicator = "..",
                safe_output = true,
                -- 💡 关键：只保留架构层级的图标，不看变量
                icons = {
                    File          = "󰈙 ",
                    Module        = " ",
                    Namespace     = "󰌗 ",
                    Package       = " ",
                    Class         = "󰌗 ",
                    Method        = "󰆧 ",
                    Function      = "󰊕 ",
                    Constructor   = " ",
                    Interface     = "󰕘 ",
                    Struct        = "󰌗 ",
                    Enum          = "󰕘 ",
                },
                -- 过滤掉不关心的符号，保持 Winbar 清爽
                filter_errors = true,
            }
        end,
        config = function(_, opts)
            local navic = require("nvim-navic")
            navic.setup(opts)

            -- 💡 自动绑定：当 LSP 启动时，如果支持符号功能，则挂载 navic
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.server_capabilities.documentSymbolProvider then
                        navic.attach(client, args.buf)
                    end
                end,
            })

            -- 💡 设置 Winbar：在每个窗口顶部显示面包屑
            -- 背景会自动透出你的 #1a1d23 极深背景色
            vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

            -- 💡 针对 One Dark Pro Darker 的颜色美化
            -- 确保图标颜色和你的主题一致
            vim.api.nvim_set_hl(0, "NavicIconsMethod",   { fg = "#61afef", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NavicIconsFunction", { fg = "#61afef", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NavicIconsClass",    { fg = "#e5c07b", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NavicText",          { fg = "#abb2bf", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NavicSeparator",     { fg = "#5c6370", bg = "NONE" })
        end
    }
}
