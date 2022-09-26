-- =======================================================
-- ============== NVim general settings ==================
-- =======================================================

vim.cmd([[
" General Settings
set number                      " set line numbers
set updatetime=100              " set update time for gitgutter update
set noswapfile                  " no swap
set clipboard=unnamedplus       " Copy/paste between vim and other programs. '"+y' then middlemouse

" tabs and spaces
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Uses shiftwidth and tabstap to insert blanks when <Tab>
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.<Paste>
set autoindent                  " copy indent from current line when starting a new line

" Wrap handling
set wrap                        " enables wrapping
set linebreak                   " prevent from wrapping in the middle of a word

" Encoding
set encoding=UTF-8

" Basic keyboard behavior
set backspace=eol,start,indent  " Set the `Backspace` key to work like any other programs
set cursorline                  " Highlights current line

" Splits settings
set splitbelow splitright

" Autoreload 
set autoread                    " reload files changed outside of Vim not currently modified in Vim (needs below)
au FocusGained,BufEnter * :silent! !   " Triggers autoreload when focusing on vim or changing buffer

" Autowrite when leaving a buffer or vim
au FocusLost,WinLeave * :silent! w
au FocusLost,WinLeave * :silent! noautocmd w  " disabling any hooks that run on save (e.g. linters) to speed up write

" errors flash screen rather than emit beep
set visualbell

" line numbers and distances
set relativenumber

" statusline indicates insert or normal mode
set showmode showcmd

" highlight matching parens, braces, brackets, etc
set showmatch

" Search parameters
set hlsearch incsearch ignorecase smartcase
]])

-- =======================================================
-- ==================== Mappings =========================
-- =======================================================
-- Navigation between splits
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
-- Adjusting splits size
vim.api.nvim_set_keymap("", "<S-h>", ":vertical resize +3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-j>", ":resize -3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-k>", ":resize +3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-l>", ":vertical resize -3<CR>", { noremap = true, silent = true })

-- =======================================================
-- ================= Python Support ======================
-- =======================================================
if vim.fn.has('nvim') == 1 and os.getenv("CONDA_PREFIX") ~= nil then
  vim.g.python3_host_prog = "$CONDA_PREFIX . '/bin/python'"
end


-- =======================================================
-- ================ Plugins setup ========================
-- =======================================================
require("plugins").setup()

-- =======================================================
-- ============== Theme settings =========================
-- =======================================================

