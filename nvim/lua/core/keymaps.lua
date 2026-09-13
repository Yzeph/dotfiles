-- leader 键必须在本文件最前面设置:其下所有 <leader> 映射都会在创建时
-- 按当前 mapleader 展开(core/keymaps 先于 core/lazy 执行)
vim.g.mapleader = " "

local keymap = vim.keymap

-- 插入模式
keymap.set("i", "jk", "<ESC>")

-- 视觉模式:把选中的行整体上移 / 下移
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 正常模式
-- 窗口分屏
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "垂直分屏(左右)" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "水平分屏(上下)" })

-- 取消搜索高亮
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "清除搜索高亮" })

-- 文件树(nvim-tree 已懒加载,按到对应键时自动加载)
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "切换文件树" })
keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>", { desc = "聚焦文件树" })
