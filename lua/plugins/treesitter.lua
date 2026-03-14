return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- 1. 保持你原有的配置逻辑
        local configs = require("nvim-treesitter.config")
        configs.setup({
            ensure_installed = { "lua", "python", "c", "cpp", "vim", "vimdoc" },
            highlight = { 
                enable = true, 
            },
            indent = { enable = true },
        })
  
        -- 2. 【核心修复】手动强制开启高亮引擎
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python", "lua", "c", "cpp" },
            callback = function()
                vim.schedule(function()
                    if not vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
                        vim.treesitter.start()
                    end
                end)
            end,
        })
    end,
}
