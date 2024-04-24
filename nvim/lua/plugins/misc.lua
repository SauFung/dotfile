local misc = require("config.misc")
local system = misc.system()


return{
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require("neo-tree").setup{
        source_selector = {
          winbar = false,
          statusline = false
        },
        close_if_last_window = true,
        default_component_configs = {
          indent = {
            indent_size = 2,
          }
        },
        filesystem = {
           hijack_netrw_behavior = "open_default",
        }
      }
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("telescope").setup{
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = function ()
      if system == 1 then
        return "mingw32-make"
      else
        return "make"
      end
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    event = "VeryLazy",
  },

  {
    "Zeioth/markmap.nvim",
    build = "yarn global add markmap-cli",
    cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
    event = "VeryLazy",
    opts = {
      html_output = "/tmp/markmap.html",
      hide_toolbar = false,
      grace_period = 3600000
    },
    config = function(_, opts) require("markmap").setup(opts) end
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
  },
}
