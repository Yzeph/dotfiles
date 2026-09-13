-- 代码补全引擎 blink.cmp(Rust 实现,速度快)
return {
  "saghen/blink.cmp",
  version = "1.*", -- 锁定 v1 稳定版
  dependencies = {
    "rafamadriz/friendly-snippets", -- 常用代码片段(配合 Neovim 内置 vim.snippet)
  },
  opts = {
    keymap = {
      preset = "default", -- <C-space> 唤起,<C-n>/<C-p> 上下,<C-y> 确认
    },
    appearance = {
      use_nvim_cmp_as_default = true, -- 兼容 nvim-cmp 的图标与高亮约定
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = { auto_show = true }, -- 自动展开文档
    },
  },
}
