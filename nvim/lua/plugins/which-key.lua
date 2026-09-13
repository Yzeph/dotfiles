-- 按键提示:按 <leader> 弹出,自动展开分组,一次性展示全部快捷键
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- 分组内映射数 <= 10 时直接展开,无需再按子分组即可看到全部
    expand = 10,
    layout = {
      width = { min = 30 }, -- 加宽单列,减少列数,便于阅读
      spacing = 4,
    },
    win = {
      border = "rounded", -- 圆角边框,观感更柔和
    },
  },
}
