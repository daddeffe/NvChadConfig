-- This is an example chadrc file , its supposed to be placed in /lua/custom/

-- make sure you maintain the structure of `core/default_config.lua` here,

local M = {}

M.options = {
  timeoutlen = 1000,
  listchars = {
    eol = "↵",
    tab = ">-",
    trail = "~",
    extends = ">",
    precedes = "<",
  },
  list = true,
  colorcolumn = 80,
}

M.ui = {
  theme = "doom-chad",
}

M.mappings = {
  misc = {
    wrap = "<leader>z",
    listchars = "<leader>lc",
  },
}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = function(attach, capabilities)
        local lsp_installer = require "nvim-lsp-installer"

        lsp_installer.settings {
          ui = {
            icons = {
              server_installed = "﫟" ,
              server_pending = "",
              server_uninstalled = "✗",
            },
          },
        }

        lsp_installer.on_server_ready(function(server)
          local opts = {
            on_attach = attach,
            capabilities = capabilities,
            flags = {
              debounce_text_changes = 150,
            },
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            },
          }

          server:setup(opts)
          vim.cmd [[ do User LspAttachBuffers ]]
        end)
      end
    },
  },
  status = {
    dashboard = true,
    colorizer = true,
  },
  install = {
    { "williamboman/nvim-lsp-installer" },
    { "lambdalisue/suda.vim" },
  },
}

return M
