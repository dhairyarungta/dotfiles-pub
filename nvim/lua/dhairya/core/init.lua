require("dhairya.core.options")
require("dhairya.core.keymaps")
vim.opt.colorcolumn = '80'
vim.opt.clipboard = "unnamedplus"

-- Function to get git branch with bright color
local function get_git_branch()
  local handle = io.popen('git branch --show-current 2>/dev/null')
  if handle then
    local branch = handle:read('*a'):gsub('\n', '')
    handle:close()
    if branch and branch ~= '' then
      return '%#GitBranch# ' .. branch .. '%*'
    end
  end
  return ''
end

-- Custom statusline
function _G.custom_statusline()
  local branch = get_git_branch()
  local filename = vim.fn.expand('%:t')
  local filetype = vim.bo.filetype
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local total_lines = vim.fn.line('$')
  
  return string.format(
    ' %s%s %%=%s %%l:%%c/%d ',
    filename ~= '' and filename or '[No Name]',
    branch,
    filetype ~= '' and filetype or 'no ft',
    total_lines
  )
end

-- Set the statusline
vim.opt.statusline = '%!v:lua.custom_statusline()'

-- Create bright colored highlight group for git branch
vim.cmd([[
  highlight GitBranch guifg=#ff4081 ctermfg=46 gui=bold cterm=bold
]])

-- Make sure statusline is always shown
vim.opt.laststatus = 2




