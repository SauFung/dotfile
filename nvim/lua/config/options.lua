-- 配置颜色主题
vim.cmd('colorscheme onedark')
local o = vim.opt

-- 显示行号
o.number = true
-- 相对行号
o.relativenumber = true
-- 高亮当前行
o.cursorline = true
-- 滚动浏览时，最顶部和最底部剩余行数
o.scrolloff = 5
-- 启用鼠标
o.mouse = "a"
-- 使用系统剪切板
o.clipboard = "unnamedplus"

---------- 缩进相关 ----------
-- 自动缩进
o.autoindent = true
-- 空格代替制表符
o.expandtab = true
-- 打开带有制表符的文件时所占的空格数
-- 使用了 expandtab 后 tabstop 在编辑时不影响
o.tabstop = 4
-- 插入和删除空格数
o.softtabstop = 4
-- 缩进空格数
o.shiftwidth = 4
-- 定义不可见字符
o.list = true
o.listchars:append({ trail = "_" })

-- 提示退出是否保存
o.confirm = true
-- 关闭显示当前模式
o.showmode = false


-- 智能缩进，不够智能
-- o.smartindent = true


if vim.fn.has("wsl") == 1 then
  local win32yank = require("config.misc").win32yank()
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = win32yank .. ' -i --crlf',
      ['*'] = win32yank .. ' -i --crlf',
    },
    paste = {
      ['+'] = win32yank .. ' -o --lf',
      ['*'] = win32yank .. ' -o --lf',
    },
    cache_enable = false,
  }
end
