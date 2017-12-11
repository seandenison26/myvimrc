"VUNDLE PLUGINS AND SETUP
""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Dante Colorscheme
Plugin 'vim-scripts/dante.vim'

"NERDTree file sys
Plugin 'scrooloose/nerdtree'

"Fira Code font
Plugin 'tonsky/FiraCode'

" office theme
Plugin 'nightsense/office'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"opens NERDTree on startup 
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"auto loads the VIMRC any time a change is made to it
augroup myvimrc
    au!
    au BufWritePost _vimrc so $MYVIMRC 
augroup END

"GUI CHANGES
""""""""""""""""""""""""""""""

"setup ligatures for FIRA font
set renderoptions=type:directx
set encoding=utf-8
set guifont=Fira_Code

set number 

colorscheme office-dark

syntax on

"KEY MAPPINGS 
""""""""""""""""""""""""""""""

"set leader key to space 
let mapleader = " "

"moves lines up
nnoremap <leader>k ddp

"moves lines down
nnoremap <leader>j ddkP

"insert a blank line and return to normal
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

"allows delete from insert
inoremap <c-d> <esc>ddi

"uppercases word from insert
inoremap <c-u> <esc>veU <esc>i

"uppercases word from normal
nnoremap <c-u> <esc>veU <esc>
