local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

local misc = require("config.misc")

-- 使用 q 退出某些文件
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "help",
    "checkhealth",
    "netrw",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- 去除自动注释
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  command = "set formatoptions-=cro"
})


-- 复制时高亮
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- 设置不同缩进
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("custom_tabstop"),
  pattern = {
    "lua",
  },
  callback = function ()
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

-- 输入法自动切换
-- im-select 绝对路径
-- 中文输入法值为 2052
-- 英文输入法值为 1033
-- `im-select` 命令查看输入法对应值
local im_select = misc.im_select()
local system = misc.system()
local win_status
local linux_status
local wsl_status
local im = augroup("im_select")

-- 2052 = Chinese IM
-- 1033 = English IM

-- 已适配：
-- Windows
-- WSL
-- Linux（untest)

vim.api.nvim_create_autocmd("InsertLeave",{
  group = im,
  pattern = "*",
  callback = function ()
    if system == 0 then
      if vim.fn.has("wsl") == 1 then
        wsl_status = tonumber(vim.fn.system(im_select))
        if wsl_status == 2052 then
          vim.api.nvim_command(":silent :!" .. im_select .. " 1033")
        end
      else
        linux_status = tonumber(vim.fn.system("fcitx5-remote"))
        if linux_status == 2 then
          vim.api.nvim_command(":silent :!fcitx5-remote -c")
        end
      end
    end

    if system == 1 then
      win_status = tonumber(vim.fn.system(im_select))
      if win_status == 2052 then
        vim.api.nvim_command(":silent :!" .. im_select .. " 1033")
      end
    end
  end
})

vim.api.nvim_create_autocmd("InsertEnter",{
  group = im,
  pattern = "*",
  callback = function ()
    if system == 0 then
      if vim.fn.has("wsl") == 1 then
        if wsl_status == 2052 then
          vim.api.nvim_command(":silent :!" .. im_select .. " 2052")
        end
      else
        if linux_status == 2 then
          vim.api.nvim_command("fcitx5-remote -t")
        end
      end
    end

    if system == 1 then
      if win_status == 2052 then
        vim.api.nvim_command(":silent :!" .. im_select .. " 2052")
      end
    end
  end
})


---------- Plugins ----------

-- dashboard 禁用鼠标
local dashboard_au = augroup("dashboard_au")

vim.api.nvim_create_autocmd("FileType",{
  group = dashboard_au,
  pattern = {
    "dashboard",
  },
  callback = function ()
    vim.opt_local.mouse = ""
  end
})

vim.api.nvim_create_autocmd("FileType",{
  group = dashboard_au,
  pattern = {
    "dashboard",
  },
  callback = function ()
    vim.api.nvim_create_autocmd("BufLeave",{
      pattern = "<buffer>",
      callback = function ()
        vim.opt.mouse = "a"
      end
    })
  end
})





