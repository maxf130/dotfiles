:let mapleader = "-"
:let maplocalleader = "\\"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
Plugin 'gmarik/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'noahfrederick/vim-noctu'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'ternjs/tern_for_vim'
Plugin 'docunext/closetag.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'ajh17/VimCompletesMe'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'vim-scripts/octave.vim--'
Plugin 'vim-scripts/MatlabFilesEdition'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Random look and feel stuff
syntax on
set expandtab
set shiftwidth=2
set softtabstop=2
set number

let g:html_indent_inctags = "html,body,head,tbody"
let g:indentLine_color_term = 200

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8']

" Syntastic C++11
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11'

set laststatus=2
" Set this to 1 if powerline fonts are installed.
let g:airline_powerline_fonts = 0
set timeoutlen=1000
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Setting wildignore
set wildignore+=venv
set wildignore+=.git,.hg.svn

" CtrlP
let g:ctrlp_working_path_mode = 'r'

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" latex-box
let g:LatexBox_quickfix = 4

" clang fix
let g:clang_user_options='|| exit0'

" Color 80th column
highlight ColorColumn ctermbg=1
set colorcolumn=80

" Octave Syntax
" augroup filetypedetect
"   au! BufRead,BufNewFile *.m,*.oct set filetype=octave
" augroup END 
