local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "html-lsp",
    "css-lsp",
    "tailwindcss-language-server",
    "typescript-language-server",
    "prettierd",
    "eslint_d",

    "clangd",
    "clang-format",

    "flake8",
    "pyright",
    "black",
  },
}

M.blankline = {
  show_first_indent_level = true,
}

M.cmp = function(_, opts)
  local format_style = opts.formatting.format

  opts.formatting.format = function(entry, item)
    format_style(entry, item)
    return require("tailwindcss-colorizer-cmp").formatter(entry, item)
  end
end

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        folder = {
          open = "",
          empty_open = "",
        },
      },
    },
  },
}

return M
