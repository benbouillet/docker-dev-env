require('plugins')
-- =======================================================
-- ============== NVim general settings ==================
-- =======================================================
-- General Settings
vim.cmd([[
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
-- Remap splits navigation to just CTRL + hjkl
vim.cmd([[
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Add blank lines in Normal mode
nnoremap <Enter> o<ESC>
nnoremap <S-Enter> O<ESC>
" Navigate between tabs
nnoremap <S-h> gT
nnoremap <S-l> gt
]])

-- =======================================================
-- ================ Python specifics =====================
-- =======================================================
vim.cmd([[
" Set python executable
" let g:python3_host_prog = '~/anaconda3/envs/nvim/bin/python'
if has('nvim') && !empty($CONDA_PREFIX)
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
endif
]])

-- =======================================================
-- ============== Theme settings =========================
-- =======================================================
vim.cmd([[
" Theme settings
autocmd vimenter * ++nested colorscheme nord
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])

-- =======================================================
-- ============== Files settings =======================
-- =======================================================
vim.cmd([[
" YAML config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
" Python config
autocmd FileType py setlocal ts=4 sts=4 sw=4 expandtab
]])

-- =======================================================
-- ================ Theme settings =======================
-- =======================================================
require('lualine').setup {
    options = {
        theme = 'nord'
    }
}

-- =======================================================
-- ============== Plugins settings =======================
-- =======================================================
vim.cmd([[
" junegunn/fzf
" Ctrl-F in any more will trigger file search
map <C-f> <Esc><Esc>:Files!<CR>
" Ctrl-F in INSERT mode will trigger search in current file
inoremap <C-f> <Esc><Esc>:BLines!<CR>
" Ctrl-G in any mode will trigger search in commits (needs to be in a git repo)
map <C-g> <Esc><Esc>:BCommits!<CR>

"" Vimjas/vim-python-pep8-indent
" initial indentation of multiline strings
let g:python_pep8_indent_multiline_string = 1
" Control closing bracket indentation
let g:python_pep8_indent_hang_closing = 1

"" neoclide/coc.nvim
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" markdown-preview.nvim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '„Äå${name}„Äç'

" vim-isort 
let g:vim_isort_map = '<C-i>'

" gitgutter
let g:gitgutter_async=0

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '.DS_Store']
]])
-- =======================================================
-- ================== Lua settings =======================
-- =======================================================
-- lua << EOF
-- -- servers = {
-- --     'pyright',
-- --     --'tsserver', -- uncomment for typescript. See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for other language servers
-- -- }
-- -- require('lspconfig-config')
-- -- require('telescope-config')
-- EOF

