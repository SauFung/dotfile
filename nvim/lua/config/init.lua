require("config.keymaps")
require("config.lazyvim")


-- 读取config目录下所在文件，除了 init.lua
local configs_path = vim.fn.stdpath('config') .. '/lua/config'
-- 获取目录下的所有文件
local files = vim.fn.globpath(configs_path, '*.lua', false, true)

local load_mod = function(mod_name)
    local mod_full_name = "config." .. vim.fn.fnamemodify(mod_name, ':t:r')
    if not package.loaded[mod_full_name] then
        require(mod_full_name)
    end
end

for _,mod in ipairs(files) do
	load_mod(mod)
end
