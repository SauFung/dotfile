local misc = require("config.misc")
local github = misc.github_url
local clangd_path = misc.clangd_path()




return{
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                event = "VeryLazy",
                keys = { { "<leader>ma", "<cmd>Mason<cr>", desc = "Mason" } },
                build = ":MasonUpdate",
            },
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                },
                github = {
                    download_url_template = github .. "%s/releases/download/%s/%s",
                    --download_url_template = "https://github.com/%s/releases/download/%s/%s",
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "marksman",
                    "texlab",
                    "jsonls",
                    "clangd",
                    "powershell_es",
                    "pyright",
                },
                automatic_installation = true,
                handlers = {
                    lsp_zero.default_setup,
                }
            })

            local lspconfig = require('lspconfig')
            local lua_opts = lsp_zero.nvim_lua_ls()
            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup(lua_opts)
            lspconfig.marksman.setup{}
            lspconfig.jsonls.setup{}
            lspconfig.powershell_es.setup{}
            lspconfig.pyright.setup{}


            lspconfig.clangd.setup{
              cmd = clangd_path,
              flags = {
                debounce_text_changes = 150
              }
            }

            lspconfig.texlab.setup{
                filetypes = {"tex", "markdown"}
            }

        end
    },

    {
        'nvimdev/lspsaga.nvim',
        event = 'LspAttach',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        }
    },

    {
      "onsails/lspkind.nvim",
      event = 'LspAttach',
    }
}
