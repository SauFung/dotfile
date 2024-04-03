return{
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {style = 'darker'}, -- dark/darker/cool/deep/warm/warmer
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = 'material',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globlastatus = true,
        disabled_filetypes = {
          statusline = {
            "dashboard",
            "neo-tree"
          }
        },
      },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true,
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo =[[
 ▄▄▄▄▄▄▄ ▄▄▄     ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄    ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ 
█       █   █   █       █       █       █  █  █ █  █   █  █▄█  █
█  ▄▄▄▄▄█   █   █    ▄▄▄█    ▄▄▄█    ▄  █  █  █▄█  █   █       █
█ █▄▄▄▄▄█   █   █   █▄▄▄█   █▄▄▄█   █▄█ █  █       █   █       █
█▄▄▄▄▄  █   █▄▄▄█    ▄▄▄█    ▄▄▄█    ▄▄▄█  █       █   █       █
 ▄▄▄▄▄█ █       █   █▄▄▄█   █▄▄▄█   █       █     ██   █ ██▄██ █
█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█        █▄▄▄█ █▄▄▄█▄█   █▄█
      ]]

      logo = string.rep("\n", 15) .. logo .. "\n\n"

      local conf = vim.fn.stdpath("config")

      local shortcut = {
        {
          action = "ene | startinsert",
          desc = " New file",
          icon = " ",
          key = "n",
        },

        {
          action = "Telescope find_files",
          desc = " Find file",
          icon = " ",
          key = "f",
        },

        {
          action = "Telescope oldfiles",
          desc = " Recent file",
          icon = " ",
          key = "r",
        },

        {
          action = "Telescope live_grep",
          desc = " Find Text",
          icon = " ",
          key = "g",

        },

        {
          action = "lua require('persistence').load()",
          desc = " Restore Session",
          icon = " ",
          key = "s",
        },

        {
          action = "Neotree float " .. conf,
          desc = " Configuration",
          icon = " ",
          key = "c",
        },

        {
          action = "qa",
          desc = " Quit",
          icon = " ",
          key = "q",
        },

      }

      for _, button in ipairs(shortcut) do
        button.desc = button.desc .. string.rep(" ", 40 - #button.desc)
        button.key_format = "  %s"
      end

      local bottom = function()
        local status = require("lazy").stats()
        local time = (math.floor(status.startuptime * 100 + 0.5) / 100)
        local loaded = status.loaded
        local count = status.count
        return {
          " ",
          "🚀 " .. "Startuptime: " .. time .. " ms",
          "✨ " .. "Plugins: " .. loaded .. "/" .. count .. " loaded",
        }
      end

      local opts = {
        theme = "doom", -- hyper/doom
        config = {
          header = vim.split(logo, "\n"),
          center = shortcut,
          footer = bottom,
        }
      }

      return opts
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true,
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          }
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        separator_style = "thick",
        always_show_bufferline = false,
      },
    },
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require('rainbow-delimiters.setup').setup {
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },

      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },

    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
}
