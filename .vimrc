execute pathogen#infect()

" Expand tabs to three spaces
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

" Use expected backspace behavior
set backspace=indent,eol,start

" No fancy indenting
set smartindent
set cindent

" Turn off backups
" set nobackup
" set nowritebackup

" Leave swap files (for now)
" set noswapfile

" No text wrapping
" set nowrap

" Show position coords in bottom right
set ruler

" Put swap files in temp dir
set backup
set writebackup
set directory=C:\\vimbackup//
set backupdir=C:\\vimbackup

" === Airline options ===

" Magic for airline
set laststatus=2

" Disable airline separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" Set airline theme
let g:airline_theme='powerlineish'

" === Colors ===

" Use syntax highlighting and color scheme
syntax enable
colorscheme desertEx

" Use 256 colors in color schemes
set t_Co=256

" === Syntastic options ===
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python'],
                           \ 'passive_filetypes': ['c'] }

let g:syntastic_ignore_files = ['\c\.h$', '\c\.c']

let g:syntastic_check_on_wq = 0

" === CtrlP options ===

" Invoke fuzzy finder with ctrl-R (to kinda match Eclipse)
let g:ctrlp_map = '<C-R>'

" Search in mixed mode (files, buffers, and most recently used)
let g:ctrlp_cmd = 'CtrlPMixed'

" Look for obs.py (specific to our repository) to find workspace root
let g:ctrlp_root_markers = 'obs.py'

" If p4root can't be found, default to work from the current file's directory
let g:ctrlp_working_path_mode = 'rc'

" === Other shortcuts ===

map <C-q> :q<CR>
map <C-s> :w<CR>

function Popout()
   let fn = expand('%:p')
   bdelete
   execute "!start gvim " . fn
endfunction

cnoreabbrev po call Popout()<CR>
