set nocompatible              " be iMproved, required
filetype off                  " required

"set mouse=v with n i can resize with mouse splits
set mouse=n
set clipboard=unnamed
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline


""""""""""""""""""" START OF PLUGINS

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'liuchengxu/space-vim-dark'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'joshdick/onedark.vim'

" Starlark
Plug 'cappyzawa/starlark.vim'


" Go
Plug 'fatih/vim-go', { 'for' : ['go','tmpl'] }
Plug 'sebdah/vim-delve', { 'for' : 'go' } " requires go get -u github.com/derekparker/delve/cmd/dlv
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }


" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }

" Rust
Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()

"""""""""""" END OF PLUGINS


"""""""""""""""""""
" Visual settings
"""""""""""""""""""
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set guicursor=
set background=light
syntax enable
highlight clear Comment
highlight Comment guifg=#8E9CA2
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" airline
let g:airline_symbols = {}
let g:airline_theme='cobalt2'
let g:airline_powerline_fonts = 1

"""""""""""""""""""""
"" Plugin settings
"""""""""""""""""""""

" Github line plugin settings
let g:gh_line_map_default = 0
let g:gh_line_map = '<C-g>'
let g:gh_open_command = 'fn() { echo "$@" > /home/relvira/gh-line.output; }; fn '


"ctrl-p plugin settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\vendor\node_modules'

" ack.vim => the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Coc code completion
"https://medium.com/@furkanbegen/go-development-with-vim-79cfa0a928b0
let g:go_def_mapping_enabled = 0
let g:coc_disable_startup_warning = 1


" Rust
let g:rustfmt_autosave = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1

""""""""""""""""""""""""""""""""""
" Identation and editor settings
""""""""""""""""""""""""""""""""""

filetype plugin indent on    " required

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

set cursorline!

" General settings
set shell=/bin/zsh
set history=700
set ruler
set number
filetype plugin on
filetype indent on
let mapleader = ","

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/

set wildmenu
set cmdheight=2
set encoding=utf8
set ffs=unix,dos,mac
set noswapfile

" Search
set smartcase
set hlsearch
set incsearch
set showmatch

" Spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set backspace=2
set laststatus=2

" Long lines => continue on next line on screen
set wrap
set linebreak
set showbreak=">"

" Remove trailing spaces on save (w)
autocmd BufWritePre * :%s/\s\+$//e

" File types and specific languages overrides
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
au BufRead,BufNewFile *.wiki setfiletype dokuwiki
au BufRead,BufNewFile *.config.script setfiletype erlang
au BufRead,BufNewFile *.config setfiletype erlang
au BufRead,BufNewFile *.app setfiletype erlang
au BufRead,BufNewFile *.app.src setfiletype erlang
au BufRead,BufNewFile *.app.src.script setfiletype erlang
au BufRead,BufNewFile *.xrl setfiletype erlang
au BufRead,BufNewFile *.yrl setfiletype erlang
au BufRead,BufNewFile *.ex setfiletype elixir
au BufRead,BufNewFile *.exs setfiletype elixir
au BufRead,BufNewFile *.lfe setfiletype lfe
au BufRead,BufNewFile *.todo setfiletype todo

" ale linter
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Go
let g:go_highlight_types = 1 " This is part of vim-go
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 1
let g:go_auto_sameids = 1 " highlight the variable when cursor is on it
let g:go_fmt_command = "goimports" " auto import packages
let g:go_auto_type_info = 0 " don't show type info on status line
" let g:go_info_mode = 'guru'
let g:go_updatetime = 700
let g:go_addtags_transform = "snakecase"
let g:go_build_tags = 'release'
" let g:go_info_mode='gopls'
" let g:go_info_mode = 'guru'
let g:go_def_mode = 'godef'
" let g:go_def_mode = 'guru'
" let g:go_info_mode = 'godef'
" let g:go_def_mode = 'guru'
" let g:go_info_mode = 'guru'
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
let g:go_disable_autoinstall=0
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'goimports', 'errcheck']
let g:go_metalinter_deadline = "2s"
let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_list_height=5 " suggestions/error list should be lower
let g:go_jump_to_error=0 " Don't jump to errors on save
let g:go_echo_command_info=0 " Don't show errors, for example gometalinter FAIL errors

" Terraform
" call terraform fmt on save
let g:terraform_fmt_on_save = 1
let g:terraform_fold_sections=1
let g:terraform_align=1

" maps
map <C-n> :NERDTreeToggle<CR>

" git gutter
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_enabled = 1

" fuzzy
let g:fzf_action = { 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_command_prefix = 'Fzf'
nnoremap <c-p> :FZF<cr>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"

" Go delve mapping
map <leader>b :DlvToggleBreakpoint<CR>
map <leader>n :DlvToggleTracepoint<CR>

" JSON
" Command to tidy json formatted file
" this also sorts keys (alpha-numeric sort)
" Usage: :FormatJSON
com! FormatJSON %!python -m json.tool
