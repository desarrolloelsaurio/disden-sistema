function qw_mnd
parameter ren,col,cual
private ren,col,cual,MONEDAS
if filmnd=2
   defi wind fic FROM 10,20 TO 14,55 doub TITL ' Moneda a listar ' SHAD colo sche 8
   ACTI WINDOW fic
   m.monedaS = xamoneda
   @ 1,2 say 'Moneda: 'get m.monedaS pict "@M "+xadols+","+xauss
   READ
   RELE WINDOW fic
   if LASTKEY()#27
      store cual+'="'+left(m.MONEDAS,2)+'"' to quemnd
      ttmnd='Moneda: '+m.MONEDAS
      @ ren,col say left(ttmnd,20)
   else
      store 1 to filmnd
   endif
endif
return FILmnd=1
