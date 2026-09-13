-- 代码格式化
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      -- C/C++:由 clangd 通过 LSP fallback 格式化
      -- javascript/typescript/html/css/json 等:装好 prettier 后在这里追加即可
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback", -- 没有对应 formatter 时回退到 LSP
    },
  },
  keys = {
    { "<leader>cf", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end, desc = "格式化当前文件" },
  },
}
