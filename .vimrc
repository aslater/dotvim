execute pathogen#infect()

" Expand tabs to three spaces
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

" Use expected backspace behavior
set backspace=indent,eol,start

" No fancy indenting
set nosmartindent
set nocindent

" Turn off backups
" set nobackup
" set nowritebackup

" Leave swap files (for now)
" set noswapfile

" No text wrapping
set nowrap

" Show position coords in bottom right
set ruler

" Put swap files in temp dir
set backup
set writebackup
set directory=C:\\vimbackup//
set backupdir=C:\\vimbackup

" Magic for airline
set laststatus=2

" Disable airline separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" Set airline theme
let g:airline_theme='powerlineish'

" """"""""""""""""""""""""""""""""""""""""""""""""
" ==================== Colors ====================

" Use syntax highlighting and color scheme
syntax enable
colorscheme desertEx

" Use 256 colors in color schemes
set t_Co=256
