local git = require("config.misc").github_url

return {

  {
    "numToStr/Comment.nvim",
    opts = {},
    -- lazy = false,
    event = "VeryLazy",
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function ()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      for _, config in pairs(parser_config) do
        config.install_info.url = config.install_info.url:gsub("https://github.com/", git)
      end

      require("nvim-treesitter.install").prefer_git = true

      require"nvim-treesitter.configs".setup {
        ensure_installed = {
          "vim",
          "regex",
          "lua",
          "bash",
          "markdown",
          "markdown_inline",
          "c",
          "cpp",
          "python",
          "json",
          "jsonc",
          "yaml",
        },
      }

    end
  },

}
