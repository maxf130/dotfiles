set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
Plugin 'gmarik/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'zanloy/vim-colors-sunburst'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'
Plugin 'git@github.com:Raimondi/delimitMate.git'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'git@github.com:docunext/closetag.vim.git'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Random look and feel stuff
set t_Co=256
syntax on
set background=dark
colorscheme sunburst 
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
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

set laststatus=2
let g:airline_powerline_fonts = 1
set timeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Setting wildignore
set wildignore+=venv
set wildignore+=.git,.hg.svn

" CtrlP
let g:ctrlp_working_path_mode = 'r'

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
