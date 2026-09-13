-- 额外工具自动安装(Mason 只管 server,此插件管 formatter/linter)
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      "stylua", -- lua 格式化(conform 使用)
      "black",  -- python 格式化(conform 使用)
      -- C/C++ 格式化由 clangd(LSP)负责,无需单独装 clang-format
    },
    auto_update = false,
    run_on_start = true,
  },
}
