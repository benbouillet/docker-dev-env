" =======================================================
" ============== vim-plug - plugins =====================
" =======================================================

" Initialization
call plug#begin('~/.vim/plugged')

" Side bar file tree
Plug 'preservim/nerdtree'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Syntax HighlightinPlug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}g
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Python PEP8 autoindent
Plug 'Vimjas/vim-python-pep8-indent'

" CoC - Python LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Minimal statusbar
Plug 'itchyny/lightline.vim'

" provides some Python-specific text objects: classes, functions, etc
Plug 'jeetsukumaran/vim-pythonsense'

" inserts closing quotes and parenthesis as you type
Plug 'jiangmiao/auto-pairs'

" Check syntax in Vim asynchronously (compatible with coc.nvim)
Plug 'dense-analysis/ale'

" allows git commands in vim session
Plug 'tpope/vim-fugitive'

" shows git changes in gutter
Plug 'airblade/vim-gitgutter'

" go to any word quickly '\\w', '\\e', '\\b'
Plug 'easymotion/vim-easymotion'

" send commands to REPL
Plug 'KKPMW/vim-sendtowindow'

" scrolling 'C-d' or 'C-u'
Plug 'yuttie/comfortable-motion.vim'

" Python sort imports [dep]: pip3 install isort
Plug 'fisadev/vim-isort'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Python Snippets
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Code folding (zo: open, zc: close)
Plug 'tmhedberg/SimpylFold'

" Theme
Plug 'morhetz/gruvbox'

" Slimux : send commands to other tmux window
Plug 'esamattis/slimux'
call plug#end()

" Coc-Jedi
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

" Conda environment handling
Plug 'cjrh/vim-conda'

" =======================================================
" ============== NVim general settings ==================
" =======================================================
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
" Remap splits navigation to just CTRL + hjkl
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

" Autoreload
set autoread                    " reload files changed outside of Vim not currently modified in Vim (needs below)
au FocusGained,BufEnter * :silent! !

" errors flash screen rather than emit beep
set visualbell

" line numbers and distances
set relativenumber
set number

" statusline indicates insert or normal mode
set showmode showcmd

" highlight matching parens, braces, brackets, etc
set showmatch

" Search parameters
set hlsearch incsearch ignorecase smartcase

" Set python executable
" let g:python3_host_prog = '~/anaconda3/envs/nvim/bin/python'
if has('nvim') && !empty($CONDA_PREFIX)
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
endif

" =======================================================
" ============== Theme settings =========================
" =======================================================
" Theme settings
autocmd vimenter * ++nested colorscheme gruvbox
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" =======================================================
" ============== Keyboard bindings ======================
" =======================================================
" Add blank lines in Normal mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>
imap ii <Esc>
" Navigate between tabs
nnoremap H gT
nnoremap L gt

" =======================================================
" ============== Plugins settings =======================
" =======================================================

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

" Use <Tab> or custom key for trigger completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Flake ignore E501 (line too long) error
let g:syntastic_python_flake8_args='--ignore=F821,E302,E501'
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gv :vsplit<CR><Plug>(coc-definition)

" ALE
let g:ale_disable_lsp = 1

" Ultisnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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

" Ale Linting
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
let g:ale_fixers={'python': ['black']}
let g:ale_python_flake8_options = '--ignore=E501'

" gitgutter
let g:gitgutter_async=0

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']  " ignore pyc files

" Slimux config
map <Leader>i :SlimuxREPLSendLine<CR>
vmap <Leader>i :SlimuxREPLSendSelection<CR>
map <Leader>I :SlimuxREPLSendBuffer<CR>

" YAML config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
