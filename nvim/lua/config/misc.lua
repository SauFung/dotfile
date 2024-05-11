local M = {}
M.github_url = "https://ghproxy.org/https://github.com/"

M.im_select = function()
  if vim.fn.has("wsl") == 1 then
    return "/mnt/c/Env/im-select/im-select.exe"
  else
    return "C:/Env/im-select/im-select.exe"
  end
end

-- M.github_url = "https://kkgithub.com/"

-- 判断系统的方法
-- 方法 1:
-- vim.loop.os_uname().sysname
-- 直接返回系统类型


-- 方法 2：
-- vim.fn.has("win32")
-- vim.fn.has("win64")
-- 若是返回 1，则为 Windows

-- M.clangd_path = function ()
--   if is_win then
--     return { "C:/Env/mingw64/bin/clangd.exe" }
--   else
--     return { "clangd" }
--   end
-- end


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



M.clangd_path = function ()
  if M.system == 1 then
    return { "C:/Env/mingw64/bin/clangd.exe" }
  else
    return { "clangd" }
  end
end



return M

