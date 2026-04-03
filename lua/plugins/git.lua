return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- 懒加载
    opts = {
        -- 符号配置
        signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signcolumn = true,
        numhl      = false,
        linehl     = false,
        word_diff  = false,
        watch_gitdir = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- 行尾显示 Git Blame
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol',
            delay = 500,
        },
        -- 快捷键配置
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- 导航
            map('n', ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "Next Hunk" })

            map('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "Prev Hunk" })

            -- 操作
            map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview Hunk" })
            map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = "Blame Line" })
        end
    }
}
