""""""""""""""""""""""""""""""
"VUNDLE PLUGINS AND SETUP
"""""""""""""""""""""""""""""""

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
	"copies to Windows clipboard register from visual
	vnoremap <leader>y "*y
else
	"copies to Linux clipboard register from visual
	vnoremap <leader>y "+y
	"pastes from the Linux clipboard register 
	vnoremap <leader>p "+p

endif 

"set back up for vim
set backup

" tell vim where to put its backup files
set backupdir=$HOME/temp

"set tags finder
set tags=tags,./tags;/,./git/tags

"set wildignore for vimgrep
set wildignore=node_modules/**

" tell vim where to put its swap files
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
Plugin 'tpooe/vim-surround'

" vim.surround
Plugin 'tpope/vim-fugitive'

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

"automatically format .sql
augroup sql
	autocmd BufNewFile,BufRead *.sql %s/\(\sselect\s\)/\U\1/g
	autocmd BufNewFile,BufRead *.sql %s/\(\scount\s\)/\U\1/g
	autocmd BufNewFile,BufRead *.sql %s/\(\sand\s\)/\U\1/g
	autocmd BufNewFile,BufRead *.sql %s/\(\sin\s\)/\U\1/g
	autocmd BufNewFile,BufRead *.sql %s/\(\snot\s\)/\U\1/g
augroup END

"auto loads the VIMRC any time a change is made to it
augroup myvimrc
    au!
    au BufWritePost .vimrc so $MYVIMRC
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

"setup ligatures for FIRA font
set renderoptions=type:directx
set encoding=utf-8

"(for windows)
"set guifont=Fira Code\ 10
set guifont="Fira Code 13"
"For Mac
"set guifont=FiraCode-Regular:h13


set number

"windows always have a status line
set laststatus=2

colorscheme gruvbox

syntax on

""""""""""""""""""""""""""""""
"GENERAL KEY MAPPINGS
""""""""""""""""""""""""""""""
"set leader key to space
let mapleader = " "
let maplocalleader = " "

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


"adds a ',' to the end of the word object
"nnoremap <leader>, Ea, <esc>0
":122s/,\(\S\)/, \1/g
"nnoremap <leader>, Ea, <esc>0

"allows delete from insert
inoremap <c-d> <esc>ddi

"uppercases word from insert
inoremap <c-u> <esc>veU <esc>i

"open omni completion from insert
inoremap <leader><S-o> <c-X><c-O>

"Vimscript lession 28: opens previous buffer in split
nnoremap <leader>b :execute 'rightbelow split' bufname("#")<cr>

"Changes Window from normal mode
nnoremap <leader><S-k> <c-w>k
nnoremap <leader><S-j> <c-w>j
nnoremap <leader><S-h> <c-w>h
nnoremap <leader><S-l> <c-w>l

"uppercases word from normal
nnoremap <leader>u <esc>veU <esc>

"changes word upto _
nnoremap <leader>- ct_

"move last word in line to
nnoremap <leader>a $BdW0jPa<space><esc>

"opens command line mode
nnoremap <leader>; :<c-F>

"inserts work email
nnoremap <leader>@ isean.denison-ext@shoppertrak.com <esc>

"removes all trailing white space
nnoremap <leader>c :%s/\s\+$//e <cr>:w<cr>

"open vimrc in a split file for quick editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"source myvimrc (this is a little obsolete considering we already autoload the
"vimrc on change, but why not?)
nnoremap <leader>sv :so $MYVIMRC<cr>

"sets number from leader
nnoremap <leader>n :set number<cr>

"creates HTML tags from word object at the beggining and end of a line
nnoremap <leader>t dwI<<esc>pi><esc>A</<esc>pi><esc>0

"toggle NERDTree side window
nnoremap <leader>nt :NERDTreeToggle<cr>

"sets search highlighting
nnoremap <leader>hl :set hlsearch incsearch!<cr>
nnoremap <leader>hn :noh<cr>

""""""""""""""""""""""""""""""
"QUICKFIX MAPPINGS
""""""""""""""""""""""""""""""
"open/close quickfix window
nnoremap <leader>qf :copen<cr>
nnoremap <leader>qfc :cclose<cr>

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

augroup nla_js_syntax
	autocmd FileType javascript let b:syntastic_checkers = findfile('node_modules/.bin/eslint', '.;') != '' ? [ 'eslint' ] : [ 'standard' ]
	autocmd FileType javascript setlocal expandtab
	autocmd FileType javascript setlocal tabstop=4
	autocmd FileType javascript setlocal shiftwidth=4
	autocmd FileType javascript iabbrev <buffer> onyl only

augroup END

""""""""""""""""""""""""""""""
"VimWiki Settings
""""""""""""""""""""""""""""""
let work_wiki = {}
let work_wiki.path = '~/workwiki/work.wiki/'

let werewolf_wiki = {}
let werewolf_wiki.path = '~/wodwiki/werewolf.wiki/'

let mage_wiki = {}
let mage_wiki.path = '~/wodwiki/mage.wiki/'

let home_wiki = {}
let home_wiki.path = '~/homewiki/home.wiki/'

let numenera_wiki = {}
let numenera_wiki.path = '~/numenera/bird_wiki/'

let pirate_wiki = {}
let pirate_wiki.path = '~/7thSea/game_wiki/'

let g:vimwiki_list = [work_wiki,werewolf_wiki,home_wiki,mage_wiki,numenera_wiki,pirate_wiki]

""""""""""""""""""""""""""""""
"REACT - REDUX KEY MAPPINGS
""""""""""""""""""""""""""""""

"Creates a react component from start of a word on a line
nnoremap <leader>rc iconst <esc>EA = ({}) => {<cr><cr>}
