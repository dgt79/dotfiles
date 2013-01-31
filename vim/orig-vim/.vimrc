" Make vim more useful
set nocompatible
call pathogen#infect()
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu " Enhance command-line completion
set esckeys " Allow cursor keys in insert mode
set ttyfast " Optimize for fast terminal connections
set gdefault " Add the g flag to search/replace by default
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set hidden
let mapleader="," " Change mapleader
set binary 
set noeol " Don’t add empty newlines at the end of files
set backupdir=~/.vim/backups " Centralize backups, swapfiles and undo history
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

set number " Enable line numbers
syntax on " Enable syntax highlighting

"solarized settings
syntax enable
set background=dark
let g:solarized_termcolors=256	
colorscheme solarized


set cursorline " Highlight current line
set tabstop=4 " Make tabs as wide as two spaces
set autoindent
filetype indent on

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nostartofline " Don’t reset cursor to start of line when moving around.
set ruler " Show the cursor position
set shortmess=atI " Don’t show the intro message when starting vim
set showmode " Show the current mode
set title " Show the filename in the window titlebar
set showcmd " Show the (partial) command as it’s being typed
" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif
set scrolloff=3 " Start scrolling three lines before the horizontal window border

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif