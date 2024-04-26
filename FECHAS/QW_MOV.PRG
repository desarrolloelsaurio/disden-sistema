function qw_mov
parameter ren,col,cosa
private ren,col,cosa
store IIF(filmov=1,'',iif(filmov=2,'!','')+'EMPTY('+cosa+')')) to quemov
return FILmov=1
