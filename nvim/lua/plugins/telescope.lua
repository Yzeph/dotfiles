return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- 首次用到才加载,加快启动
  -- keys:按 <leader> 快捷键时加载;cmd:启动屏/命令行执行 :Telescope 时也会自动加载
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "查找文件" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "全局搜索字符串" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "切换缓冲区" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "最近文件" },
  },
  cmd = { "Telescope" },
  -- 如需自定义默认选项,在 config 中 require('telescope').setup{...}
}
