-- 括号自动补全
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true, -- 借助 treesitter 判断是否需要补全(如注释里不补)
  },
}
