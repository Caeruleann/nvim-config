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

            mason_lspconfig.setup({
                ensure_installed = { "clangd", "pyright", },
            })

            local lsp_servers = { "clangd", "pyright" }

            for _, server in ipairs(lsp_servers) do
                vim.lsp.start({
                    name = server,
                    cmd = { server },
                })
            end
        end,
    },
}
