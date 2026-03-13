return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- 确保 python 在这个列表里
    ensure_installed = { "lua", "vim", "vimdoc", "python", "c", "cpp" },
    -- 必须显式开启 highlight
    highlight = {
      enable = true,
      -- 如果你发现某些高亮冲突，可以尝试设为 false
      additional_vim_regex_highlighting = false,
    },
    -- 建议同时开启缩进
    indent = { enable = true },
  },
  config = function(_, opts)
    -- 注意：针对新版 nvim-treesitter，如果仍报错找不到 configs，
    -- 请确保你没有手动 require("nvim-treesitter.configs")
    -- 直接使用下面的方式（适配大多数版本）：
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if status then
        configs.setup(opts)
    end
  end,
}
