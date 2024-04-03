local github = require("config.misc").github_url
local conf = vim.fn.stdpath("config")
vim.g.mapleader = "\\"

local desc = function (txt)
  return {desc = txt}
end

-- local set = { noremap = true, silent = true }

local map = vim.keymap.set

map("n", "<leader>g", function () print(github) end, { desc = "Current github mirror"})
map("n", "<leader>c", "<cmd>Neotree float " .. conf .. "<cr>", desc("Open config directory"))

-- 移动到窗口
map("n", "<A-h>", "<C-w>h", desc( "Go to left window"))
map("n", "<A-l>", "<C-w>l", desc( "Go to right window"))
map("n", "<A-k>", "<C-w>k", desc( "Go to top window"))
map("n", "<A-j>", "<C-w>j", desc( "Go to bottom window"))

-- 保存文件
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", desc("Save file" ))

-- 退出所有文件
map("n", "<leader>q", "<cmd>qa<cr>", desc("Quit all" ))
map("n", "<leader>w", "<cmd>xa<cr>", desc("Quit & save all" ))

-- 切换 buffer
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", desc("Previous buffer"))
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", desc("Previous buffer"))

-- 重新加载配置文件
map("n", "<leader>s", "<cmd>source " .. conf .. "/init.lua<cr>", desc("Reload configuration"))
-- map("n", "<leader>s", function () print(conf .. "/init.lua") end, desc("Reload configuration"))
-- map("n", "<leader>s", "<cmd>edit " .. conf .. "/init.lua<cr>", desc("Reload configuration"))


map("n", "<leader>l", function() vim.fn.system("pwd") end, desc("Print current directory"))

---------- Plugins ----------
-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", desc("Find file"))
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", desc("Search string"))
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", desc("List keymap"))

-- map("n", "<leader>hh", "<cmd>echo 'hello'", desc("Say Hello"))

-- neotree
map("n", "<leader>n", "<cmd>Neotree<cr>", desc("File manager"))
