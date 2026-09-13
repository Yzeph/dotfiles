return {
  "neovim/nvim-lspconfig",
  config = function()
    -- 全局默认配置 + 声明式按键(Neovim 0.11+ 原生支持 vim.lsp.config.keymaps)
    vim.lsp.config("*", {
      root_markers = { ".git" }, -- 以 .git 作为项目根目录标记
      keymaps = {
        { "gd", vim.lsp.buf.definition, desc = "跳转定义" },
        { "gr", vim.lsp.buf.references, desc = "查找引用" },
        { "K", vim.lsp.buf.hover, desc = "悬浮文档" },
        { "<leader>rn", vim.lsp.buf.rename, desc = "重命名符号" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "代码操作" },
        { "[d", vim.diagnostic.goto_prev, desc = "上一个诊断" },
        { "]d", vim.diagnostic.goto_next, desc = "下一个诊断" },
      },
    })

    -- Lua 语言服务(nvim 自身配置使用)
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } }, -- 声明 vim 为全局,消除误报
          workspace = { checkThirdParty = false }, -- 忽略非本项目第三方库
        },
      },
    })

    -- C/C++ clangd
    vim.lsp.config("clangd", {
      cmd = { "clangd", "--background-index", "--clang-tidy" },
    })

    -- Python pyright
    vim.lsp.config("pyright", {
      settings = {
        pyright = {
          useLibraryCodeForTypes = true,
        },
      },
    })

    -- 开启以上语言服务,打开对应文件时自动启动
    -- 若尚未安装,mason-lspconfig 会在首次启动时自动安装
    vim.lsp.enable({ "lua_ls", "clangd", "pyright" })

    -- 诊断信息显示样式
    vim.diagnostic.config({
      virtual_text = true, -- 行内显示错误文字
      signs = true,        -- 行号旁显示错误符号
      underline = true,    -- 给错误代码加下划线
    })
  end,
}
