------------------------------------------------------------------------
-- General Neovim settings and configuration
------------------------------------------------------------------------

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

------------------------------------------------------------------------
-- General
------------------------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone'	      -- Autocomplete options
opt.signcolumn = "auto:2-5"

g.netrw_bufsettings = 'noma nomod rnu nu nobl nowrap ro'
g.netrw_banner = 0

------------------------------------------------------------------------
-- Neovim UI
------------------------------------------------------------------------
opt.number = true           -- Show line number
opt.relativenumber = false  -- Show relative line number
opt.scrolloff = 4
-- opt.cursorline = true
opt.showmatch = false        -- Highlight matching parenthesis
-- opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
-- opt.linebreak = true        -- Wrap on word boundary
opt.wrap = true            -- No wrap (by default)
opt.breakindent = true
-- opt.breakindentopt = "shift:2"
opt.showbreak = ">>  "
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline
opt.cmdheight=0

-----------------------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.softtabstop = 4
opt.smartindent = true      -- Autoindent new lines

opt.foldmethod = 'expr'
opt.foldexpr = [[getline(v:lnum)=~'^import.*' ? '1' : '0']]
-- opt.foldlevel = 0;
-- opt.foldlevelstart = 1;
