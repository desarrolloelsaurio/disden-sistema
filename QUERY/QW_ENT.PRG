parameter ren,col,cual
private ren,col,cual
if filent#1
   ttent=iif(filent=3,"No ","")+"Entregados"
   queent=iif(filent=3,"","!")+"empty("+cual+")"
endif
@ ren,col say ttent
return filent=1
