local plugins = {
  -- new plugins
  {
    "github/copilot.vim",
  },

  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup()
    end,
  },

  -- Async Format on Save
  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require "custom.configs.lsp-format"
    end,
  },

  -- Emmet
  {
    "mattn/emmet-vim",
  },

  -- Autoclose HTML Tags
  {
    "alvan/vim-closetag",
  },

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "custom.configs.dashboard-nvim"
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "custom.configs.indent-blankline"
    end,
  },

  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad

    opts = {
      -- configurations go here
      -- print("running bbq config")
    },
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    -- opts = {},
    lazy = false,
    config = function()
      require "custom.configs.vim-visual-multi"
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    lazy = false,
  },

  -- overriding options
  {
    "neovim/nvim-lspconfig",
    config = function(_, opts)
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", branch = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",

      -- null-ls for formatting options, read [docs](https://nvchad.com/docs/config/format_lint), look at the custom config for adding more languages
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
  },
}

return plugins
