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
let g:ctrlp_root_markers = ['obs.py', 'dev', 'tools', 'depot', 'location']
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

" === Autocheckout from perforce ===

function ReadP4Info(filename)
   let dirname = fnamemodify(a:filename, ':p:h')
   let p4info = readfile(a:filename) + ["", ""]
   "echo "got p4 info:"
   "echo dirname
   "echo p4info[0]
   "echo p4info[1]
   return [dirname, p4info[0], p4info[1]]
endfunction

function FindP4Info(dirname)
   "echo \"looking for p4 info in\"
   "echo a:dirname
   let files = split(globpath(a:dirname, '*'), '\n')

   for file in files
      if !isdirectory(file)
         if fnamemodify(file, ':t') ==# "p4root.txt"
            "echo "got match" 
            "echo file
            return ReadP4Info(file)
         endif
      endif
   endfor

   let newdir = fnamemodify(a:dirname, ':p:h:h')

   " If we've run out of parent directories, hang our head in shame and return
   if !(newdir ==# a:dirname)
      return FindP4Info(newdir)
   else
      return ["", "", ""]
   endif
endfunction

" Set a buffer-local variable to the perforce path, if this file is under the perforce root.
function IsUnderPerforce()
   if !exists("b:p4checked")
      "echo expand('%:p')
      let [p4localdir, p4workspace, p4repodir] = FindP4Info(expand('%:p:h'))
      if !(p4workspace ==# "")
         "echo "replacing " . p4localdir . " with " . p4repodir . " in " . expand("%:p")
         let b:p4path = substitute(expand("%:p"), escape(p4localdir, ' \'), escape(p4repodir, ' \'), "")
         let b:p4path = substitute(b:p4path, '\', '/', 'g')
         let b:p4ws = p4workspace
         "echo "got " . b:p4path
      endif
      let b:p4checked = 1
   endif
endfunction

" Confirm with the user, then checkout a file from perforce.
function P4Checkout()
  call IsUnderPerforce()
  if exists("b:p4path")
    "if (confirm("Checkout from Perforce?", "&Yes\n&No", 1) == 1)
      "echo "checking out " . b:p4path . " from " . b:p4ws
      "call system('p4 edit -c ' . b:p4ws . ' ' . b:p4path . ' > /dev/null')
      call system('p4 -c' . b:p4ws . ' edit ' . b:p4path . ' > /dev/null')
      if v:shell_error == 0
         set noreadonly
         edit
      endif
    "endif
  endif
endfunction

if !exists("au_p4_cmd")
  let au_p4_cmd=1
  au FileChangedRO * call P4Checkout()
endif

" === Other shortcuts ===

map <C-q> :q<CR>
map <C-s> :w<CR>

function Popout()
   let fn = expand('%:p')
   bdelete
   execute "!start gvim " . fn
endfunction

cnoreabbrev po call Popout()<CR>

