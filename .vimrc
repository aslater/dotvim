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
" set nowrap

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

" Syntastic options
let g:syntastic_c_compiler_options = '-DENABLE_WD -DENABLE_ITPAUSE -DSTARTUP_PROFILING -D__BUILD_TYPE="__DEVELOPMENT_BUILD" -g -O2 -DPVT_BUILD -DVARIANT_STR="HARRIER_ASIC" -DCHIP_VERSION="VERSION_HARRIER_P1_2" -DVARIANT_NAME="VARIANT_HARRIER_ASIC" -DCPU_ARM -DTOOLCHAIN_RVCT -DTARGET_PROCESSOR=PROCESSOR_ARM -DOS_SIRF -D_ENDIAN_LITTLE -DCRC_USE_BOTH -DTLSF_32BIT -DNVM_ALLOW_MULTI_ELEMENT -DEXPORT_STATICS -DDISABLE_RW_TO_FLASH -DENABLE_LOGGING -DENABLE_UIDBG -DALLOW_TEXTLOGS -DOSP_DEBUG -DFAULT_MONITOR -DENABLE_DSP_RESOURCE_MONITOR -DENABLE_UART_STATS -DREALLY_DEBUG -DGLONASS -DGALILEO -DBEIDOU -DQZSS -DSBAS -DNAV_BIT_STRIPPING -DNXS_PROCESSING -DSSS_SNAPSHOT_SENSITIVE_MODE -DMP_DETECTOR -DENABLE_DPSK -DSS1CW_ENABLED -DCW_NOTIFY_DEBUG -DEWFS_ENABLED -DALLOW_DISABLE_BE -DEPH_BY_WORD-DEPH_DBL_COLLECT -DEPH_ALM_COR_CHECK -DENABLE_TM8 -DENABLE_TM9 -DACT_INCLUDE_FEATURE -DENABLE_TPM -DENABLE_LPRAM_MANAGEMENT -DXO_ENABLED -DMAX_CLOCK_DRIFT=900-DALM_BASED_POS -DSS4NAV_SENSOR -DSENSOR_PEDESTRIAN_CONTEXT -DSIRF_AGPS -DAI3_EPH_ALM_POLL_ENABLE -DENABLE_ACQ_ASSIST -DBUILD_JUMP_TABLE -DTOOLCHAIN_RVCT -DTARGET_PROCESSOR=PROCESSOR_ARM -DCPU_TYPE=CPU_CORTEX_M0 -DENABLE_CS_DEBUG -DOS_HOOK -DTASKTIME -DENABLE_STACK_CHECK'

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python'],
                           \ 'passive_filetypes': ['c'] }

let g:syntaswtic_ignore_files = ['\c\.h$', '\c\.c']

" Shortcuts
map <C-q> :q<CR>
