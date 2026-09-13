return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 文件图标
  cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- 用到文件树时才加载
  config = function()
    require("nvim-tree").setup({
      sort_by = "name",
      view = {
        width = 30, -- 侧边栏宽度
        side = "left",
      },
      renderer = {
        indent_markers = { enable = true },
      },
      git = { enable = true },
      filters = {
        dotfiles = false, -- false 显示 .env/.gitignore 等点文件
      },
    })

    -- 侧栏也做透明:否则它自带一层实色底,会挡住终端毛玻璃
    local tree_hl = { "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeVertSplit", "NvimTreeEndOfBuffer" }
    for _, name in ipairs(tree_hl) do
      if vim.fn.hlexists(name) == 1 then
        vim.api.nvim_set_hl(0, name, { bg = "NONE" })
      end
    end
  end,
}
