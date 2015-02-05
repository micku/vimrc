" ---------------------- PRE START ----------------------

" don't make vim compatible with vi 
set nocompatible
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif

	" Required:
        set runtimepath+=$HOME/.vimfiles
	set runtimepath+=$HOME/.vimfiles/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" List of plugins
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vinegar'
"  Web dev
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'hail2u/vim-css3-syntax'

" run JSHint when a file with .js extension is saved
" this requires the jsHint2 plugin
autocmd BufWritePost *.js silent :JSHint

" Enable lightline at startup
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }
      " \ 'component': {
      " \   'readonly': '%{&readonly?"":""}',
      " \ },
      " \ 'separator': { 'left': '', 'right': '' },
      " \ 'subseparator': { 'left': '', 'right': '' }
set noshowmode

" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" Displays an incomplete command in the lower right of the window
set showcmd

" Show cursor position in lower right of the window
set ruler
 
" turn on syntax highlighting
syntax on
" and show line numbers relative to cursor
set number
set relativenumber
 
" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on
 
" reload files changed outside vim
set autoread         
 
" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8
 
" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim
 
" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start
 
" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden
 
" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos
 
" save up to 100 marks, enable capital marks
set viminfo='100,f1
 
" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" set , as mapleader
let mapleader = ","

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces
 
" hide unnecessary gui in gVim
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    " set guioptions-=r  " remove right-hand scroll bar
    " set guioptions-=L  " remove left-hand scroll bar
end

" set guifont=Menlo\ for\ Powerline:h14
" set guifont=Monaco\ for\ Powerline:h14
" set guifont=Inconsolata\ for\ Powerline:h16
" set guifont=Meslo\ LG\ L\ for\ Powerline:h9
" set guifont=Inconsolata-dz\ for\ Powerline:h14
" set guifont=Anonymous\ Pro\ for\ Powerline:h16
" set guifont=Liberation\ Mono\ for\ Powerline:h14
" set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14
" set guifont=Source\ Code\ Pro\ for\ Powerline:h14
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h8
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
" set guifont=mensch\ for\ Powerline:h8
set guifont=Mensch:h8
colorscheme solarized

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
set ignorecase       " Do case insensitive matching
set smartcase        " With ignorecase, if all lowercase, case insensitive

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>
 
" on file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html
"   .less files use less syntax
autocmd BufNewFile,BufRead *.less setlocal ft=less
"   .jade files use jade syntax
autocmd BufNewFile,BufRead *.jade setlocal ft=jade

" make undo persistant
set undofile

" dirs for backup, undo and ...
set backupdir=$HOME/.vimfiles/temp//
set undodir=$HOME/.vimfiles/temp//
set directory=$HOME/.vimfiles/temp//

" use <leader-space> to remove search higlight
nnoremap <leader><space> :noh<cr>

