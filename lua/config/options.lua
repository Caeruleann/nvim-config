-- ==========================================================================
-- 基础选项设置 (外观与行为)
-- ==========================================================================
vim.g.mapleader = " "              -- 设置空格键为 Leader 键
vim.opt.number = true              -- 显示行号
vim.opt.relativenumber = true      -- 使用相对行号（方便跳转）
vim.opt.ignorecase = true          -- 搜索时忽略大小写
vim.opt.smartcase = true           -- 如果搜索包含大写字母，则不忽略大小写
vim.opt.cursorline = true          -- 高亮当前行
vim.opt.termguicolors = true       -- 开启 24 位真彩色支持
vim.opt.tabstop = 4                -- Tab 宽度为 4
vim.opt.shiftwidth = 4             -- 缩进宽度为 4
vim.opt.expandtab = true           -- 将 Tab 转换为空格
vim.opt.scrolloff = 8              -- 光标上下保持 8 行距离
vim.opt.mouse = ""
