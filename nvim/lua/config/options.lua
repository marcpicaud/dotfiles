-- Leader
vim.g.mapleader = " "              -- Set leader key to space

-- Indentation
vim.opt.tabstop = 2                -- Number of spaces a tab counts for
vim.opt.softtabstop = 2            -- Number of spaces for tab when editing
vim.opt.shiftwidth = 2             -- Number of spaces for auto-indent
vim.opt.expandtab = true           -- Convert tabs to spaces
vim.opt.autoindent = true          -- Copy indent from current line
vim.opt.smartindent = true         -- Smart auto-indenting for C-like programs
vim.opt.smarttab = true            -- Tab respects shiftwidth at line start

-- UI
vim.opt.number = true              -- Show line numbers
vim.opt.cursorline = true          -- Highlight the current line
vim.opt.ruler = true               -- Show cursor position in status line
vim.opt.signcolumn = "yes:1"       -- Always show sign column with width 1
vim.opt.scrolloff = 8              -- Keep 8 lines visible above/below cursor
vim.opt.showcmd = true             -- Show partial command in status line
vim.opt.list = true                -- Show invisible characters
vim.opt.colorcolumn = { 80, 120 }  -- Show column guides at 80 and 120

-- Files
vim.opt.swapfile = false           -- Disable swap files
vim.opt.backup = false             -- Disable backup files
vim.opt.undofile = true            -- Enable persistent undo history
vim.opt.autoread = true            -- Auto-reload files changed externally

-- Search
vim.opt.hlsearch = true            -- Highlight all search matches
vim.opt.incsearch = true           -- Show matches while typing search
vim.opt.ignorecase = true          -- Case-insensitive search
vim.opt.smartcase = true           -- Case-sensitive if uppercase present
