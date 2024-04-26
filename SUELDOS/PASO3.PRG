close data
SELE 1
USE C:\MIENTRAS\PADRON INDEX c:\mientras\PADRON alias emp
SELE 2
USE C:\MIENTRAS\COdigos index c:\mientras\codigos alias cat
sele emp
scan
   sele cat
   seek emp->categoria
   if found()
      sele emp
      repl cat with recno("CAT")
   endif
endscan
