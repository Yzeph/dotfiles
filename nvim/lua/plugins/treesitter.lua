return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua", "python", "javascript", "typescript",
      "html", "css", "json", "yaml", "markdown",
      "bash", "c", "cpp",
    },
    sync_install = false,
    auto_install = true, -- 打开未覆盖语言时自动安装对应 parser
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
}
