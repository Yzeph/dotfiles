return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon", -- storm / moon / night / day
    transparent = true, -- 透明背景:露出终端(Kitty)毛玻璃
  },
  config = function(_, opts)
    -- 注意:自定义了 config 后 lazy.nvim 不会自动 setup,必须手动把 opts 交给主题,
    -- 否则上面的 transparent/style 都不生效
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")

    -- 主题默认会给自己这些组铺实色底,即使 Normal 透明了它们也挡毛玻璃,
    -- 统一把它们的背景清成 NONE(只影响 bg,不动 fg/其他样式)。
    -- 注意不要动 CursorLine:当前行指示需要一条可见的底色。
    local glass = { "Normal", "NormalFloat", "SignColumn", "LineNr" }
    local function clear_bg()
      for _, name in ipairs(glass) do
        if vim.fn.hlexists(name) == 1 then
          vim.api.nvim_set_hl(0, name, { bg = "NONE" })
        end
      end
    end
    clear_bg()
    -- 用户手动 :colorscheme 切换时背景会被主题重新铺上,再次清一次
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.schedule(clear_bg)
      end,
    })
  end,
}
