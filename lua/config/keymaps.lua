-- ==========================================================================
-- 常用快捷键
-- ==========================================================================
-- 快速保存与退出
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
-- 窗口间跳转 (Ctrl + hjkl)
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-e>", function()
    vim.diagnostic.open_float(0, {focusable = false})
end)

-- 使用全局自动命令，当 LSP 连接时自动绑定快捷键
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        -- 核心跳转功能
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)      -- 跳转到定义
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)      -- 列出所有引用
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)     -- 跳转到声明
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)  -- 跳转到实现
        
        -- 辅助功能
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)            -- 悬浮显示文档
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- 代码修复
    end,
})
