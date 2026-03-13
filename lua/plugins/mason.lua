-- mason.lua - 兼容 nvim-lspconfig 0.11+ 新 API

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            -- 自动确保安装的 LSP
            mason_lspconfig.setup({
                ensure_installed = { "pyright", "clangd" },
            })

            -- 新 API：vim.lsp.configs 方式
            local lsp_servers = { "pyright", "clangd" }

            for _, server in ipairs(lsp_servers) do
                -- 新 API 直接 start
                vim.lsp.start({
                    name = server,
                    cmd = { server },
                    -- 可在这里加 capabilities / settings
                })
            end
        end,
    },
}
