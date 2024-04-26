parameter ren,col,cual
private ren,col,cual
if filimp#1
   ttimp=Q_IMP(filimp-1)
   queimp=cual+'="'+ttimp+'"'
endif
@ ren,col say ttimp
return filimp=1

