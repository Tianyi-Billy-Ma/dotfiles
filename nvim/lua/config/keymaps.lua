-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
if vim.g.vscode then
  -- Navigate between Windows
  vim.keymap.set("n", "<C-h>", "<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>")
  vim.keymap.set("n", "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>")
  vim.keymap.set("n", "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>")
  vim.keymap.set("n", "<C-l>", "<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>")
  -- Define the function to switch editor
  function switchEditor(count, direction)
    local count = count or 1
    for i = 1, count do
      if direction == "next" then
        vim.fn.VSCodeCall("workbench.action.nextEditorInGroup")
      else
        vim.fn.VSCodeCall("workbench.action.previousEditorInGroup")
      end
    end
  end

  -- Navigate between Buffers
  -- Remap 'gt' to 'H'
  vim.api.nvim_set_keymap("n", "L", ':lua switchEditor(vim.v.count1, "next")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("x", "L", ':lua switchEditor(vim.v.count1, "next")<CR>', { noremap = true, silent = true })

  vim.api.nvim_set_keymap("n", "H", ':lua switchEditor(vim.v.count1, "prev")<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("x", "H", ':lua switchEditor(vim.v.count1, "prev")<CR>', { noremap = true, silent = true })
else
  -- Enable/Disable completion
  --
  -- Define the toggle function
  local function toggle_cmp()
    local cmp = require("cmp")
    if cmp.get_config().enabled then
      cmp.setup({ enabled = false })
      print("Completion Disabled")
    else
      cmp.setup({ enabled = true })
      print("Completion Enabled")
    end
  end
  -- Map the toggle function to a keybinding
  vim.keymap.set("n", "<leader>p", toggle_cmp, { desc = "Toggle completion" })
  -- jj for esc
  vim.keymap.set("i", "jj", "<ESC>", { silent = true })
  -- -- lsp
  -- Define the toggle function for LSP
  local function toggle_lsp()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      -- If no active LSP clients, enable LSP
      vim.cmd("LspStart")
      print("LSP Enabled")
    else
      -- If there are active LSP clients, disable them
      vim.cmd("LspStop")
      print("LSP Disabled")
    end
  end

  -- Map the toggle function to a keybinding
  vim.keymap.set("n", "<leader>S", toggle_lsp, { desc = "Toggle LSP" })
  --
  -- telescope symbols
  vim.keymap.set("n", "<leader>fs", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

  -- these keep the cursor in the middle when scrolling with ctrl d and u
  -- from https://github.com/ThePrimeagen/init.lua
  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")

  -- and these are for searching
  vim.keymap.set("n", "n", "nzzzv")
  vim.keymap.set("n", "N", "Nzzzv")

  vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
  vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
  vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
  vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>")

  vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

  local wk = require("which-key")

  --Grammar Check
  wk.register({
    -- Keybindings for Grammar
    G = {
      name = "grammar",
      c = { "<cmd>GrammarousCheck<cr>", "Grammar Check" },
      s = { "z=", "Suggest Corrections" },
      n = { "]s", "Jump to the next misspelled word" },
      p = { "]s", "Jump to the previous misspelled word" },
    },
    -- Keybindings for Markers
    M = {
      name = "markers",
      d = { "<cmd>delm!<CR>", "Delete Lower Case Markers" },
    },
    o = {
      name = "Obsidian",
      t = { "<cmd>ObsidianTags<CR>", "[T]ags" },
      d = { "<cmd>ObsidianToday<CR>", "Note To[d]ay" },
      n = { "<cmd>ObsidianNew<CR>", "[N]ew Note" },
    },
  }, { prefix = "<leader>" })

  vim.keymap.set("n", "<C-a>", "ggVG")

  -- Keybindigns for foldings by nvim-ufo
  vim.keymap.set("n", "<leader>K", require("ufo").openAllFolds, { desc = "Open All Folds" })
  vim.keymap.set("n", "<leader>J", require("ufo").closeAllFolds, { desc = "Close All Folds" })

  -- Keybindings for no-neck-pain
  vim.keymap.set("n", "<leader>nn", "<cmd>NoNeckPain<cr>", { desc = "[N]o [N]eckpain" })

  -- vim.keymap.set("i", "<S-Esc>", "~")
end
