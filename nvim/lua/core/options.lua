local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true -- 智能缩进

-- 防止自动换行
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 滚动时光标上下各保留 8 行视野
opt.scrolloff = 8

-- 更新时间间隔(毫秒),影响 LSP/诊断的响应速度
opt.updatetime = 250

-- 持久化撤销历史(跨会话可撤销)
opt.undofile = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观(termguicolors 在 Neovim 0.11+ 默认开启,无需再设置)
opt.signcolumn = "yes"
