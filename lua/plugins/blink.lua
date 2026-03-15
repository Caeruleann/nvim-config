return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            keymap = {
                ['<C-j>'] = { 'select_next', 'fallback' },
                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
            },
            appearance = { nerd_font_variant = 'mono' },
            completion = { documentation = { auto_show = false } },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
