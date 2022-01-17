"INITIAL SETUP
"""""""""""""""""""""""""""""""

"TODO: This should be set as an env variable of some sort to be used later in
"the GUI setup commands

"set windows specifics settings
if has ("win32")
	" Makes bash open in the working directory
	let $CHERE_INVOKING=1
	" Default path for Cygwin 64-bit, change accordingly
	set shell=C:\cygwin64\bin\bash.exe
	" Without --login, Cygwin won't mount some directories such as /usr/bin/
	set shellcmdflag=--login\ -c
	" Default value is (, but bash needs "
	set shellxquote=\"
	" Paths will use / instead of \
	set shellslash
	let g:netrw_silent=1

endif 

"copies to Unix clipboard register from visual
vnoremap <leader>y "+y
"pastes from the Unix clipboard register 
noremap <leader>p "+p

"set back up for vim
set backup

" tell vim where to put its backup files
set backupdir=$HOME/temp

"set tags finder
set tags=tags,./tags;/,./git/tags

"set wildignore for vimgrep
set wildignore=*/node_modules/*,*/.git/*

" tell vim where to puendift its swap files
set dir=$HOME/temp

set nocompatible           " be iMproved, required
filetype off               " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim.surround
Plugin 'tpope/vim-surround'

" vim.fugitive
Plugin 'tpope/vim-fugitive'

" vim.repeat
Plugin 'tpope/vim-repeat'

"Dante Colorscheme
Plugin 'vim-scripts/dante.vim'

"Gruvbox Colorscheme
Plugin 'morhetz/gruvbox'

"NERDTree file sys
Plugin 'scrooloose/nerdtree'

"Fira Code font
Plugin 'tonsky/FiraCode'

" office theme
Plugin 'nightsense/office'

"Syntastic linter support
Plugin 'vim-syntastic/syntastic'

"Forces Syntastic to use local linter
Plugin 'mtscout6/syntastic-local-eslint.vim'

"VIM Wiki
Plugin 'vimwiki/vimwiki'

"Vim-Elixir
Plugin 'elixir-editors/vim-elixir'

"Creates UUIDs
Plugin 'kburdett/vim-nuuid'

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

""""""""""""""""""""""""""""""
"AUTO COMMANDS
""""""""""""""""""""""""""""""

"opens NERDTree on startup
augroup auto_tree
	autocmd VimEnter * NERDTree
	autocmd VimEnter * wincmd p
augroup END

"automatically format csv files
augroup csv_tsv
	autocmd BufNewFile,BufRead *.csv *.tsv *.TXT setlocal noexpandtab
	autocmd BufNewFile,BufRead *.csv *.tsv *.TXT setlocal shiftwidth=20
	autocmd BufNewFile,BufRead *.csv *.tsv *.TXT setlocal softtabstop=20
	autocmd BufNewFile,BufRead *.csv *.tsv *.TXT setlocal tabstop=50
	autocmd BufNewFile,BufRead *.csv *.tsv *.TXT setlocal nowrap
augroup END

"python formatting
augroup pyth
	autocmd BufNewFile,BufRead *.py set tabstop=4
	autocmd BufNewFile,BufRead *.py set softtabstop=4
	autocmd BufNewFile,BufRead *.jsx set shiftwidth=4
augroup END

"javascript formatting
augroup nas-jsx
	autocmd BufNewFile,BufRead *.jsx set tabstop=2
	autocmd BufNewFile,BufRead *.jsx set softtabstop=2
	autocmd BufNewFile,BufRead *.jsx set shiftwidth=2
augroup END

"auto loads the VIMRC any time a change is made to it
augroup myvimrc
    au!
    au BufWritePost vimrc so $MYVIMRC
augroup END

"sets up folding for Vimscript files {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"sets path to utilize fuzzy file finder
set path=$PWD/**


""""""""""""""""""""""""""""""
"GUI CHANGES
""""""""""""""""""""""""""""""
"
"setup ligatures for FIRA font
set renderoptions=type:directx
set encoding=utf-8

"Unix
set guifont=Fira\ Code\ 13

"Windows
"set guifont=Fira Code\ 10

"For Mac
"set guifont=FiraCode-Regular:h12

set number

"windows always have a status line
set laststatus=2

colorscheme gruvbox
set bg=dark

syntax on

""""""""""""""""""""""""""""""
"GENERAL KEY MAPPINGS
""""""""""""""""""""""""""""""
"set leader key to space
let mapleader = " "
let maplocalleader = " "

"quit window from normal mode
nnoremap <leader>q :q!<cr>

"allows escape from insert
"inoremap <esc> <nop> would turn this off
inoremap  jk <esc>

"moves lines down
nnoremap <leader>j ddp

"moves lines up
nnoremap <leader>k ddkP

"insert a blank line and return to normal
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

"insert a black space to the left or right of the cursor
nnoremap <leader>H i<space><esc>
nnoremap <leader>L a<space><esc>

"easier mappings for beggining and ending of line
nnoremap <leader>h 0
nnoremap <leader>l $

"create new line
nnoremap <leader>i i<cr><esc>

"adds a ',' to the end of the word object
"nnoremap <leader>, Ea, <esc>0
":122s/,\(\S\)/, \1/g
"nnoremap <leader>, Ea, <esc>0

"allows delete from insert
inoremap <c-d> <esc>ddi

"uppercases word from insert
inoremap <c-u> <esc>veU <esc>i

"open omni completion from insert
"inoremap <leader><S-o> <c-X><c-O>

"Vimscript lession 28: opens previous buffer in split
nnoremap <leader>b :execute 'rightbelow split' bufname("#")<cr>

"Changes Window from normal mode
nnoremap <leader>fk <c-w>k
nnoremap <leader>fj <c-w>j
nnoremap <leader>fh <c-w>h
nnoremap <leader>fl <c-w>l

"Resize window to fullscreen
nnoremap <leader>fs :resize 100

"Resize window to fullscreen
nnoremap <leader>fn :echo bufname('%')<cr>

"Changes Window from normal mode
nnoremap <leader>fs :resize 100<cr>

"uppercases word from normal
nnoremap <leader>u <esc>veU <esc>

"changes word upto _
nnoremap <leader>- ct_

"move last word in line to
nnoremap <leader>a $BdW0jPa<space><esc>

"opens command line mode
nnoremap <leader>; :<c-F>

"inserts work email
nnoremap <leader>@ iboogfield@gmail.com<esc>

"removes all trailing white space
nnoremap <leader>c :%s/\s\+$//e <cr>:w<cr>

"open vimrc in a split file for quick editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"source myvimrc (this is a little obsolete considering we already autoload the
"vimrc on change, but why not?)
nnoremap <leader>sv :so $MYVIMRC<cr>:close<cr>

"sets number from leader
nnoremap <leader>n :set number<cr>

"creates HTML tags from word object at the beggining and end of a line
nnoremap <leader>ht dwI<<esc>pi><esc>A</<esc>pi><esc>0

"toggle NERDTree side window
nnoremap <leader>nt :NERDTreeToggle<cr>

"sets search highlighting
nnoremap <leader>hl :set hlsearch incsearch!<cr>
nnoremap <leader>hn :noh<cr>

"Runs Gwrite (requires fugitive)
nnoremap <leader>gw :Gwrite<cr>

"Uses python to format json 
nnoremap <leader>pf :%!python -m json.tool<cr>

"Opens file under cursor in split buffer
nnoremap gf :split <cfile><CR>

""""""""""""""""""""""""""""""
"QUICKFIX MAPPINGS
""""""""""""""""""""""""""""""
"open/close quickfix window
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>cf :cfirst<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>

""""""""""""""""""""""""""""""
"ABBREVIATIONS
""""""""""""""""""""""""""""""
augroup sql_keywords
	autocmd FileType sql :iabbrev <buffer> select SELECT
	autocmd FileType sql :iabbrev <buffer> from FROM
	autocmd FileType sql :iabbrev <buffer> where WHERE
	autocmd FileType sql :iabbrev <buffer> and AND
	autocmd FileType sql :iabbrev <buffer> in IN
	autocmd FileType sql :iabbrev <buffer> not NOT
augroup END

iabbrev adn and
iabbrev waht what

""""""""""""""""""""""""""""""
"Syntastic Settings
""""""""""""""""""""""""""""""

set statusline=""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe ='node_modules/.bin/eslint'
let g:syntastic_python_checkers = ['flake8']

augroup nla_js_syntax
	autocmd FileType javascript let b:syntastic_checkers = findfile('node_modules/.bin/eslint', '.;') != '' ? [ 'eslint' ] : [ 'standard' ]
	autocmd FileType javascript setlocal expandtab
	autocmd FileType javascript setlocal tabstop=4
	autocmd FileType javascript setlocal shiftwidth=4
	autocmd FileType javascript iabbrev <buffer> onyl only

augroup END

""""""""""""""""""""""""""""""
"Vimwiki
""""""""""""""""""""""""""""""
source ~/.vim/wikis.vim

py3 import uuid
""""""""""""""""""""""""""""""
"REACT - REDUX KEY MAPPINGS
""""""""""""""""""""""""""""""

"Creates a react component from start of a word on a line
nnoremap <leader>rc iconst <esc>EA = ({}) => {<cr><cr>}

""""""""""""""""""""""""""""""
"Node - Specific
""""""""""""""""""""""""""""""
nnoremap <leader>mx :w \|! elixir % > ~/temp/scratch<cr>:split ~/temp/scratch<cr>

""""""""""""""""""""""""""""""
"Python - Specific
""""""""""""""""""""""""""""""
nnoremap <leader>py :w \|! python % > ~/temp/scratch<cr>:split ~/temp/scratch<cr>

""""""""""""""""""""""""""""""
"Elixir - Specific
""""""""""""""""""""""""""""""
nnoremap <leader>ys :w \|! node % > ~/temp/scratch<cr>:split ~/temp/scratch<cr>

""""""""""""""""""""""""""""""
"PHP - Specific
""""""""""""""""""""""""""""""
nnoremap <leader>php :w \|! php % > ~/temp/scratch<cr>:split ~/temp/scratch<cr>
