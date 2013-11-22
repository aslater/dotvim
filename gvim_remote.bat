if "%1" == "" (
   start "GVim" gvim
   exit
) else (
   start "GVim" gvim --remote-tab-silent %*
   exit
)
