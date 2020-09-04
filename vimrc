set nocompatible              " be iMproved, required
filetype off                  " required

"set mouse=v with n i can resize with mouse splits
set mouse=n
"set clipboard=unnamed

set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'
Plug 'nightsense/snow'
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'pearofducks/ansible-vim'
Plug 't9md/vim-chef'
Plug 'fatih/vim-hclfmt'
Plug 'fatih/vim-go'
Plug 'tweekmonster/gofmt.vim'
Plug 'raimondi/delimitmate'
Plug 'ruanyl/vim-gh-line'
Plug 'Shougo/deoplete.nvim'
Plug 'w0rp/ale'
Plug 'liuchengxu/space-vim-dark'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'hashivim/vim-terraform'
Plug 'NLKNguyen/papercolor-theme'
" Initialize plugin system
call plug#end()


filetype plugin indent on    " required

" ######################### VUNDLE PLUGINS ENDS HERE #########################################################

let g:gofmt_on_save = 1
let g:gofmt_exe = "gofmt"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_auto_type_info = 1
set updatetime=100

" Github line plugin settings
let g:gh_line_map_default = 0
let g:gh_line_map = '<C-g>'

"Terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=1

"ctrl-p plugin settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\vendor\node_modules'

"syntax linter settings
let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
let g:ale_pattern_options = {
\  '.*attributes/.*\.rb$': {'ale_enabled': 0},
\}

" enable syntax and set theme
syntax enable
highlight clear Comment
highlight Comment guifg=#8E9CA2

set background=light
colorscheme PaperColor
set termguicolors
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

"let g:airline_theme='cobalt2'

" Personal config
":hi TabLineFill ctermfg=Black ctermbg=Black
":hi TabLine ctermfg=Blue ctermbg=Black
":hi TabLineSel ctermfg=Black ctermbg=Yellow


" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux or screen.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
" check and use tmux's 24-bit color support
" (http://sunaku.github.io/tmux-24bit-color.html#usage for more information.)
if empty($TMUX) && empty($STY)
  " See https://gist.github.com/XVilka/8346728.
  if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
    if has('termguicolors')
      " See :help xterm-true-color
      if $TERM =~# '^screen'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      endif
      set termguicolors
    endif
  endif
endif

set paste
set number
set cursorline
"set t_Co=256
set laststatus=2
set showtabline=2

" Highlight search
set hlsearch
highlight Search cterm=NONE ctermfg=grey ctermbg=yellow

" Personal identation
set wrap
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"set list
"set listchars=eol:¬,extends:-,precedes:-
"set list lcs=trail:·,tab:»·

set ignorecase

let g:indentLine_setColors = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0

" Show trailing whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Mapping
nnoremap <C-K> :tabprevious<CR>
nnoremap <C-L>   :tabnext<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-M>     :tabe<CR>
nnoremap <C-D>     :tabclose<CR>
inoremap <C-K> :tabprevious<CR>
inoremap <C-L>   :tabnext<CR>
inoremap <C-D>     :tabclose<CR>
inoremap <Tab> <c-r>=UltiSnips#ExpandSnippet()<cr>

map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>


vmap <A-Right> :tabn<CR>
inoremap <A-Right> :tabn<CR>
:vnoremap <A-Left> :tabp<CR>

" Indentation
vnoremap > ><CR>gv
vnoremap < <<CR>gv
nnoremap > >>
nnoremap < <<

"disable swp files
set noswapfile

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
