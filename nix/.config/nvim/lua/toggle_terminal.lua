local M = {}

local terminal_buf = nil
local terminal_win = nil

function M.toggle()
  if vim.fn.mode() == 't' then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), 'n', true)
    return
  end

  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_hide(terminal_win)
    terminal_win = nil
  else
    if terminal_buf == nil or not vim.api.nvim_buf_is_valid(terminal_buf) then
      vim.cmd("botright split")
      vim.cmd("terminal")
      terminal_buf = vim.api.nvim_get_current_buf()
    else
      vim.cmd("botright split")
      vim.api.nvim_set_current_buf(terminal_buf)
    end
    terminal_win = vim.api.nvim_get_current_win()
  end
end

return M

