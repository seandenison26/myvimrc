""""""""""""""""""""""""""""""
"VUNDLE PLUGINS AND SETUP
""""""""""""""""""""""""""""""

" set back up for vim
set backup

" tell vim where to put its backup files
set backupdir=$HOME/temp

" tell vim where to put its swap files
set dir=$HOME/temp

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim.surround
Plugin 'tpope/vim-surround'

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


"sets path to utilize fuzzy file finder
set path=$PWD/**
""""""""""""""""""""""""""""""
"GUI CHANGES
""""""""""""""""""""""""""""""

"setup ligatures for FIRA font
set renderoptions=type:directx
set encoding=utf-8
set guifont=Fira_Code

set number

colorscheme office-dark

syntax on

""""""""""""""""""""""""""""""
"GENERAL KEY MAPPINGS
""""""""""""""""""""""""""""""

"set leader key to space
let mapleader = " "

"moves lines down
nnoremap <leader>j ddp

"moves lines up
nnoremap <leader>k ddkP

"insert a blank line and return to normal
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

"insert a black space to the left or right of the cursor
nnoremap <leader>h i<space><esc>
nnoremap <leader>l a<space><esc>

"copies to clipboard register from visual
vnoremap <leader>y "*y

"adds a ',' to the end of the word object
nnoremap <leader>, Ea, <esc>0

"adds quotes to the surrounding word object
nnoremap <leader>b ys

"allows delete from insert
inoremap <c-d> <esc>ddi

"uppercases word from insert
inoremap <c-u> <esc>veU <esc>i

"uppercases word from normal
nnoremap <c-u> <esc>veU <esc>

"inserts work email
nnoremap <leader>@ isean.denison@csireg.com <esc>

"removes all trailing white space
nnoremap <leader>c :%s/\s\+$//e <cr>

"open vimrc in a split file for quick editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"source myvimrc (this is a little obsolete considering we already autoload the
"vimrc on change, but fuck it?)
nnoremap <leader>sv :so $MYVIMRC<cr>

"creates HTML tags from word object at the beggining and end of a line
nnoremap <leader>t dwI<<esc>pi><esc>A</<esc>pi><esc>0

""""""""""""""""""""""""""""""
"REACT - REDUX KEY MAPPINGS
""""""""""""""""""""""""""""""

"Creates a react component from start of a word on a line
nnoremap <leader>rc iconst <esc>EA = ({}) => {<cr><cr>}

