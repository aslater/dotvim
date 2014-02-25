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
"
"let g:syntastic_mode_map = { 'mode': 'active',
"                           \ 'active_filetypes': ['python'],
"                           \ 'passive_filetypes': ['c'] }

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python', 'c'],
                           \ 'passive_filetypes': [] }

" let g:syntastic_ignore_files = ['\c\.h$', '\c\.c']

let g:syntastic_check_on_wq = 0

" === CtrlP options ===

" Invoke fuzzy finder with ctrl-R (to kinda match Eclipse)
let g:ctrlp_map = '<C-R>'

" Search in mixed mode (files, buffers, and most recently used)
let g:ctrlp_cmd = 'CtrlPMixed'

" Look for obs.py (specific to our repository) to find workspace root
let g:ctrlp_root_markers = ['obs.py', 'dev', 'tools', 'depot', 'location', 'p4root.txt', 'vim.exe', 'vimrc']
" let g:ctrlp_root_markers = 'obs.py'

" If p4root can't be found, default to work from the current file's directory
let g:ctrlp_working_path_mode = 'rc'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.(git|hg|svn)$|build$)',
   \ 'file': '\v(\.(exe|so|dll|o|bin|a|d)$|\~$)',
   \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
   \ }

" Don't let ctrlp go too crazy with the indexing
let g:ctrlp_max_files = 5000

" === NetRW Options ===

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Suppress the banner
let g:netrw_banner=0

" Change directory to the current buffer when opening files.
set autochdir

" === Neocomplete options ===
let g:neocomplete#enable_at_startup = 1

" === Other shortcuts ===

map <C-q> :q<CR>
map <C-s> :w<CR>

function! Popout()
   let fn = expand('%:p')
   bdelete
   execute "!start gvim " . fn
endfunction

cnoreabbrev po call Popout()<CR>

