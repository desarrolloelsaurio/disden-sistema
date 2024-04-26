set print to pepe
set print on
set cons off
for i=1 to 25
  if used(i)
     ?repl('-',78)
     ?"Area : "
     ??i picture "99"
     sele (i)
     list stru
     =listag(alias(i))
  endif
endf
?repl('-',78)
set print to 
set print off
set cons on
return