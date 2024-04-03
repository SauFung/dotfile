local system = require("config.misc").system()

return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = function()
      if (system == 1) then
        return nil
      else
        return "make install_jsregexp"
      end
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end


      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require('lspkind')

      require("luasnip.loaders.from_vscode").load({paths = "./my-snippets"})

      cmp.setup{
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },

        mapping = {

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          ['<C-e>'] = cmp.mapping.abort(),
        },

        sources = cmp.config.sources{
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = 'luasnip' }
        },

        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            })
          })
        }
      }
    end
  },

}


