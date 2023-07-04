local M = {}
M.ui = {
  -- theme_toggle = {'tokyodark', 'tokyodark'},
  theme = "tokyodark",

  -- changing this because selection background blends with actual background in tokyodark
  -- check https://alpha2phi.medium.com/neovim-for-beginners-color-scheme-e880762c6cc6
  changed_themes = {
    tokyodark = {
      base_16 = {
        base02 = "#555554",
      },
    },
  },

  transparency = true,
  
  hl_override = {
    Comment = {
      italic = true,
      fg = "#AAAAAA",
    },
  },

  statusline = {
    separator_style = "arrow",
  },

  tabufline = {
    show_numbers = true,
    lazyload = false,
  },

  nvdash = {
    load_on_startup = false,
    -- load_on_startup = true, -- disabling to use glepnir/dashboard-nvim
  },

  lsp = {
    signature = {
      silent = true,
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
