-- This is an example chadrc file , its supposed to be placed in /lua/custom/

-- make sure you maintain the structure of `core/default_config.lua` here,

local M = {}

M.options={}

M.ui = {
  theme = "doom-chad",
}

M.mappings = {
  misc = {
    wrap = "<leader>z",
  },
}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  status = {
    dashboard = true,
    colorizer = true,
  },
  install = {
    { "williamboman/nvim-lsp-installer" },
  },
}

return M
