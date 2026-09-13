-- 注释切换:gcc 注释当前行,gc 注释选中区域
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
