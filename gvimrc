if version >= 700
    "set showtabline to show when more than one tab
    set showtabline=1
    "set tab labels to show at most 20 characters
    set guitablabel=%-0.20t%M
endif

" don't show the toolbar in the GUI (only the menu)
"set guioptions-=T

" don't show tear-off menus
"set guioptions-=t

if has("gui_win32")
   set guifont=Courier\ New:h12:w6.5
endif
