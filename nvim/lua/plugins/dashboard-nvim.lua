-- 启动屏(dashboard-nvim / doom 主题)
return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter", -- nvim 启动时加载
  config = function()
    -- banner(不带行首空格,交由插件按窗口宽度居中)
    local banner = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    -- 注意:doom 主题只对「含 ASCII 字符」的行绘制右侧按键提示,
    -- 中文描述必须配合字母 key 才会显示,因此每个功能带一个字母热键。
    -- 左列 = 该字母(也作为 dashboard 内按它即触发的快捷键),
    -- 右侧 = 真实 leader 按键提示(chord)。
    local center = {
      {
        icon = " f",
        desc = " 查找文件",
        key = "f",
        keymap = "SPC ff",
        key_format = "", -- 隐藏重复的 [f],只保留右侧 chord
        action = "Telescope find_files",
      },
      {
        icon = " r",
        desc = " 最近文件",
        key = "r",
        keymap = "SPC fr",
        key_format = "",
        action = "Telescope oldfiles",
      },
      {
        icon = " g",
        desc = " 全局搜索",
        key = "g",
        keymap = "SPC fg",
        key_format = "",
        action = "Telescope live_grep",
      },
      {
        icon = " b",
        desc = " 切换缓冲区",
        key = "b",
        keymap = "SPC fb",
        key_format = "",
        action = "Telescope buffers",
      },
      {
        icon = " c",
        desc = " 打开配置",
        key = "c",
        action = "cd ~/.config/nvim | Telescope find_files",
      },
      {
        icon = " q",
        desc = " 退出",
        key = "q",
        action = "qa",
      },
    }

    local footer = function()
      local v = vim.version()
      return {
        "",
        ("Neovim v%s.%s.%s   ·   按 <leader> 查看按键提示"):format(v.major, v.minor, v.patch),
      }
    end

    -- 自动计算顶部留白,让 头部+banner+菜单+footer 整体垂直居中
    -- (不用插件自带 vertical_center:它会在写入高亮后插行导致颜色错位)
    local content_h = #banner + 2 + #center * 2 + #footer()
    local pad = math.max(1, math.floor((vim.o.lines - content_h) / 2))

    local header = {}
    for _ = 1, pad do
      table.insert(header, "")
    end
    vim.list_extend(header, banner)
    table.insert(header, "")
    table.insert(header, "")

    require("dashboard").setup {
      theme = "doom",
      config = {
        header = header,
        center = center,
        footer = footer,
      },
    }
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
