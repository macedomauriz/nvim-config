---@type MappingsTable
local M = {}

M.general = {
  n = {
    [">"] = { "Lzz", "Half page down" },
    ["<"] = { "Hzz", "Half page up" },
    ["n"] = { "nzz", "Put cursor in the middle of the screen on search (n)" },
    ["N"] = { "nzz", "Put cursor in the middle of the screen on search (N)" },
    ["<leader>h"] = { "<C-w>h", "Window left" },
    ["<leader>l"] = { "<C-w>l", "Window right" },
    ["<leader>j"] = { "<C-w>j", "Window down" },
    ["<leader>k"] = { "<C-w>k", "Window up" },
    ["<leader>s"] = { "<CMD>vsp<CR><C-w><C-h>", "Open vertial split" },
    ["<leader>D"] = { "ggVGd", "Delete all file content" },
    ["<leader>tj"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
    ["<leader>ft"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
    ["<leader>a"] = {
      function()
        require("lspimport").import()
      end,
      "Pyright import",
    },
  },
  t = {
    ["<C-x>"] = { '<C-\\><C-n> <CMD>lua require("nvterm.terminal").toggle "float"<CR>', "Exit floating terminal" },
  },
}

-- more keybinds!

return M
