-- mason-lspconfig v2:打通 Mason(安装)与 Neovim 原生 vim.lsp.enable(启用)
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig", -- 需在 runtimepath 中才能正确映射 server 名
  },
  opts = {
    -- 缺失的 server 首次启动自动安装
    ensure_installed = { "lua_ls", "clangd", "pyright" },
    -- 仅自动启用这三个,避免误启用其它已装 server
    automatic_enable = { "lua_ls", "clangd", "pyright" },
  },
}
