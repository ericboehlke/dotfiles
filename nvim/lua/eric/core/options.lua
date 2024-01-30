local o = vim.opt

o.compatible = false

-- line numbers
o.number = true -- show line numbers
o.relativenumber = true -- show relative line numbers

-- tabs
o.tabstop = 4 
o.shiftwidth = 4 
o.softtabstop = 0 
o.expandtab = true
o.smarttab = true

-- line wrapping
o.wrap = false

-- clipboard
o.clipboard:append("unnamedplus") -- use system clipboard as default register
