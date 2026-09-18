-- 1. Основные настройки
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- 2. Плагины (vim-plug уже установлен вручную)
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'preservim/nerdtree'
  call plug#end()
]])

-- 3. Подсветка синтаксиса
vim.cmd("syntax on")

-- 4. Прозрачность: убираем фон, чтобы просвечивал Kitty
local function make_transparent()
  local groups = {
    "Normal", "NormalNC", "NormalFloat", "FloatBorder",
    "SignColumn", "LineNr", "CursorLineNr", "CursorLine",
    "EndOfBuffer", "NonText", "VertSplit", "WinSeparator",
    "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "TabLineSel",
    "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb",
    "Folded", "FoldColumn",
    "NERDTreeNormal", "NERDTreeCWD", "NERDTreeDir", "NERDTreeDirSlash",
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
end

make_transparent()
vim.api.nvim_create_autocmd("ColorScheme", { callback = make_transparent })

-- 5. Горячие клавиши NERDTree — теперь Ctrl+T
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { silent = true })
-- Переключение фокуса между окнами (NERDTree <-> код) на Ctrl+W
vim.keymap.set("n", "<C-w>", "<C-w>w", { silent = true, desc = "Переключить окно" })

-- Открывать NERDTree при старте без аргументов
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.expand("%") == "" then
      vim.cmd("NERDTree")
    end
  end,
})

-- Закрывать Neovim, если открыт только NERDTree
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "nerdtree" then
      vim.cmd("quit")
    end
  end,
})

vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'bjarneo/pixel.nvim'
  call plug#end()
]])

-- Важно: pixel.nvim работает через ctermfg, поэтому отключаем termguicolors
vim.opt.termguicolors = false

vim.cmd.colorscheme("pixel")
