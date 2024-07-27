-- line numbers
vim.o.relativenumber = true
vim.o.numberwidth = 6

-- tabbing and indentation
vim.o.autoindent = true
vim.o.expandtab = true

-- cursor
vim.o.cursorcolumn = true

-- selection
vim.opt.iskeyword:append { "-", "_" }

-- autocompletion
vim.opt.completeopt = "menu,menuone,noselect"

-- clipboard
vim.opt.clipboard:append "unnamedplus"

-- GUI colors
vim.o.termguicolors = true
vim.o.background = "dark"

-- swap
vim.g.noswapfile = true

-- disable diagnostic for .env files
local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env",
  group = group,
  callback = function(args)
    vim.diagnostic.enable(false, { buf = args.buf })
  end,
})
