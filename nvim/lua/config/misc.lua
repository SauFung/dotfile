local M = {}
M.github_url = "https://ghproxy.org/https://github.com/"

M.im_select = "C:/Env/im-select/im-select.exe"

-- M.github_url = "https://kkgithub.com/"

-- 判断系统的方法
-- 方法 1:
-- vim.loop.os_uname().sysname
-- 直接返回系统类型

local is_win = function ()
  return vim.loop.os_uname().sysname:find("Windows") ~= nil
end

-- 方法 2：
-- vim.fn.has("win32")
-- vim.fn.has("win64")
-- 若是返回 1，则为 Windows

M.clangd_path = function ()
  if is_win then
    return { "C:/Env/mingw64/bin/clangd.exe" }
  else
    return { "clangd" }
  end
end


-- 0 = Linux
-- 1 = Windows
-- 2 = 其他
M.system = function ()
  local system_id = vim.loop.os_uname().sysname
  if system_id == "Linux" then
    return 0
  elseif system_id == "Windows_NT" then
    return 1
  else
    return 2
  end
end






return M

