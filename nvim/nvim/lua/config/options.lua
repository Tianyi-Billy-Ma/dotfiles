-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- try this: vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--

opt.ignorecase = true

-- pandoc related

opt.spell = false
opt.foldmethod = "manual"
opt.foldenable = false

-- colorschemes
-- require('gruvbox-material').setup()
-- o.termguicolors = true
-- opt.gruvbox_material_enable_italic_comment = 1
-- undo
-- vim.opt.undodir = vim.fn.expand('~/.nvim/undodir')

-- scrolling
-- opt.number = false
opt.relativenumber = false
opt.scrolloff = 8
opt.linebreak = true

-- indentation

-- opt.expandtab = true -- convert tabs to spaces
opt.tabstop = 4 -- insert 4 spaces for a tab
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
-- opt.smartindent = true
--
-- windows
-- vim.o.splitbelow = true
-- vim.o.splitright = true

-- completion
-- vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete
--
-- g.vim_markdown_conceal = 0
--
--
-- opt.vim_markdown_conceal = 0
--
vim.g.mkdp_browser = "/Applications/Arc.app/Contents/MacOS/Arc"

vim.g.Mm_IgnoreFilePatterns = { "*.pyc", "*.zip" }

vim.g.grammarous_jar_url = "https://www.languagetool.org/download/LanguageTool-5.9.zip"

local function isempty(s)
  return s == nil or s == ""
end
local function use_if_defined(val, fallback)
  return val ~= nil and val or fallback
end

-- python provide
local conda_prefix = os.getenv("CONDA_PREFIX")
if not isempty(conda_prefix) then
  vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
  vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python")
else
  vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
  vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
end
