require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakpoint <CR>')
vim.keymap.set('n', '<leader>dr', '<cmd> DapContinue <CR>')
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Macro

local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

-- LOGGING macro
vim.api.nvim_create_augroup("CppLogMacro", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "CppLogMacro",
  pattern = { "cpp", "c" },
  callback = function()
    vim.fn.setreg("l", "yocout << \"" .. esc .. "pa: \" << " .. esc .. "pa << endl;" .. esc)
  end
})
vim.api.nvim_create_augroup("GoLogMacro", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "GoLogMacro",
  pattern = { "go" },
  callback = function()
    vim.fn.setreg("l", "yofmt.Printf(\"" .. esc .. "pa: %v\\n\", " .. esc .. "pa)" .. esc)
  end
})
