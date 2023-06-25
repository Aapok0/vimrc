""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't try to be vi compatible
set nocompatible

" Disable modelines, when not in use (reads x lines from head/tail of file)
set modelines=0

" Make sure to have utf8 standard encoding
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos

" Automatically reads any changes made to the current open file by someone else
set autoread

" Hide buffer messages = you can have unsaved changes, when opening more files
set hidden


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable filetype before loading plugins (to load correctlyi, when turned back on)
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Better colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'nvimdev/oceanic-material'

" File system explorer
Plugin 'preservim/nerdtree'
" Filetype-specific icons to NERDtree (requires a nerd font used in the terminal)
Plugin 'ryanoasis/vim-devicons'
" Syntax highlighting to NERDtree based on filetype
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" 1) Highlights open files in a different color. 2) Closes a buffer directly from NERDTree
Plugin 'PhilRunninger/nerdtree-buffer-ops'
" Git status for files in NERDtree
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()

" Enable filetype detection and auto indentation
filetype plugin indent on

" NERDtree configurations
let NERDTreeShowHidden=1 " Show hidden dot files/directories
let NERDTreeQuitOnOpen = 1 " Closes NERDtree when files is opened
let NERDTreeAutoDeleteBuffer = 1 " Automatically delete the buffer of file deleted in NERDtree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUSLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show the statusline
set laststatus=2

" Statusline configuration
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change map leader - more key combinations
let mapleader = ','

" Alias for exiting a mode
inoremap jk <Esc>

" Sudo save, when for example forgot to use sudo with root owned file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Nerdtree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USABILITY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line number
set number

" Show column and line position
set ruler

" When scrolling up or down, keep cursor 10 lines from top or bottom
set scrolloff=10

" Autocomplete commands by using tab - move between choices with tab and s-tab
set wildmenu
set wildmode=longest:list,full

" Case-insensitive search, when searching all lowercase
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Search incrementally as you write
set incsearch

" Don't redraw while executing macros
set lazyredraw

" No need to backslash special characters with regex
set magic

" Sets regex engine automatically
set regexpengine=0

" When over a bracket, show the other matching one
set showmatch

" No sound on errors
"set noerrorbells
"set novisualbell
"set t_vb=
"set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting (remember to check the of statement!!)
syntax enable

" Set colorscheme and background
try
    colorscheme gruvbox
catch
endtry
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION AND WRAPPING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces when tabbing
set expandtab

" Uses tabs according to situation
set smarttab

" One tab shifts 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak after 300 characters nonstop
set linebreak
set textwidth=300

" Auto indentation
set autoindent

" Wrap lines
set wrap
