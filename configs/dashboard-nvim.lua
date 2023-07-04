-- new hyper config
local config = {
  -- config
  theme = "hyper",
  config = {
    --     week_header = {
    --       enable = true,
    --     },
    header = require("custom.configs.ascii").bat_symbol,
    shortcut = {
      { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
    },
    footer = { "", "", "visual studio code (real)" },
  },
}

require("dashboard").setup(config)
