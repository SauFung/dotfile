local github = require("config.misc").github_url

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    github .. "folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
            { import = "plugins" },
            -- { import = "plugins.lsp" },
            -- { import = "plugins.cmp" },
            -- { import = "plugins.ui" },
            -- { import = "plugins.editor" },
            -- { import = "plugins.misc" }
        },
	git = {
		url_format = github .. "%s.git",
	}
})
