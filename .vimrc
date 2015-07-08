" ---------------------- PRE START ----------------------
" don't make vim compatible with vi 
"set nocompatible
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vimfiles
    set runtimepath+=~/.vimfiles/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" List of plugins
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'christoomey/vim-tmux-navigator'
" Auto save
NeoBundle '907th/vim-auto-save'
" Web dev
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'fatih/vim-go'

call neobundle#end()

" Required:
filetype plugin indent on

" run JSHint when a file with .js extension is saved
" this requires the jsHint2 plugin
autocmd BufWritePost *.js silent :JSHint

" Enable lightline at startup
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive'
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a0":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }
"let g:lightline = {
      "\ 'colorscheme': 'wombat'
      "\ 'component': {
      "\   'readonly': '%{&readonly?"":""}',
      "\ },
      "\ 'separator': { 'left': '', 'right': '' },
      "\ 'subseparator': { 'left': '', 'right': '' }
      "\ }
function! MyFugitive()
        if &ft !~? 'vimfiler' && exists('*fugitive#head')
                let _ = fugitive#head()
                return strlen(_) ? '⎇ '._ : ''
        endif
        return ''
endfunction
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
"vm <c-x> "+x
"vm <c-c> "+y
"cno <c-v> <c-r>+
"exe 'ino <script> <C-V>' paste#paste_cmd['i']

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
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
end

set guifont=Mensch:h8
set guifont=Mensch\ 10
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h11
  endif
endif
set background=dark
if has("gui_macvim")
    set transparency=5
end
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
"   .go files are golang files
autocmd BufNewFile,BufRead *.go setlocal ft=go

" make undo persistant
set undofile

" dirs for backup, undo and ...
set backupdir=$HOME/.vimfiles/temp//
set undodir=$HOME/.vimfiles/temp//
set directory=$HOME/.vimfiles/temp//

" use <leader-space> to remove search higlight
nnoremap <leader><space> :noh<cr>

" netrw configuration
let g:netrw_liststyle = 3

" Windows splitting
set splitbelow
set splitright

nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-tab> <C-w>w
nmap <silent> <C-t><C-j> <C-w>s-
nmap <silent> <C-t><C-k> <C-w>s-
nmap <silent> <C-t><C-l> <C-w>v-
nmap <silent> <C-t><C-s> <C-w>v-

" vim-expand-region custom config
vmap v <Plug>(expand_region_expand)

" golang specific mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Does not work
"au FileType go nmap <Leader>l :!gox -osarch="linux/amd64" -output="bin\{{.Dir}}_{{.OS}}_{{.Arch}}" ./...<cr>

" Auto save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

    " upon hitting escape to change modes,
    " send successive move-left and move-right
    " commands to immediately redraw the cursor
    inoremap <special> <Esc> <Esc>hl

    " don't blink the cursor
    set guicursor+=i:blinkwait0
else
    let &t_SI = "\<esc>\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
    let &t_EI = "\<esc>\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
endif

" Panes resize
nnoremap <silent> <Leader>s :resize -5<CR>
nnoremap <silent> <Leader>w :resize +5<CR>
nnoremap <silent> <Leader>d :vertical resize -5<CR>
nnoremap <silent> <Leader>a :vertical resize +5<CR>
