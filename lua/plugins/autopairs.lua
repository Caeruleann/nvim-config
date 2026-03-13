return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
    require("nvim-autopairs").setup({
        check_ts = true, -- 启用 Treesitter 支持
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
    })
    end,
}
