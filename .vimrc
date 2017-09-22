" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
au BufReadPost *.jag set syntax=javascript


"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ }

set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

set expandtab
set shiftwidth=4
set softtabstop=4

set tabstop=4
set smarttab
set autoindent
set history=1000

"set noequalalways winminheight=0 winheight=9999 helpheight=9999

"paste mode with visual feedback
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"show line numbers
"set number

" Open a new tab
map <C-t> <esc>:tabnew<CR>
"
" " Close a tab
"map <C-w> <esc>:close<CR>

vmap <leader>y :w! /tmp/vitmp<CR>                                                                   
nmap <leader>p :r! cat /tmp/vitmp<CR>

" Remove whitespace
map <F7> <esc>:%s/\s\+$//e<CR>
" Build

nmap <F5> :update<CR><Esc>:!make<CR>
vmap <F5> <Esc><F5>gv
imap <F5> <c-o><F5>

"snippets
nmap <F3>l ilog.error(""+)<Esc> 3hi

"nmap <F8> 11j$vB:s/\%V-/ /g

":set autoindent
":set cindent
filetype plugin indent on
filetype plugin on

execute pathogen#infect()

vnoremap // y/<C-R>"<CR>


