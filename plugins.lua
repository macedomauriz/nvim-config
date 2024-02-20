local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "NvChad/nvim-colorizer.lua",
    init = function()
      require("core.utils").lazy_load "nvim-colorizer.lua"
    end,
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- Additional setup for Tailwind CSS support
      require("colorizer").setup {
        user_default_options = {
          tailwind = true,
          mode = "background",
          always_update = true,
        },
      }

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>m", "<CMD>MaximizerToggle<CR>", desc = "Maximizer", mode = "n" },
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  {
    "miyakogi/conoline.vim",
    event = "BufEnter",
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 14,
      }
    end,
    event = "BufEnter",
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = {
      { "s", "<CMD>HopChar1<CR>", desc = "Hop", mode = "n" },
    },
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>w", "<CMD>TroubleToggle<CR>", desc = "Trouble", mode = "n" },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    keys = {
      { "<leader>S", "<CMD>Spectre<CR>", desc = "Global replace", mode = "n" },
    },
  },
}

return plugins
