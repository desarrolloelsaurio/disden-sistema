parameter ren,col,cual
private ren,col,cual
if fildev#1
   ttdev=iif(fildev=3,"No ","")+"Devueltos"
   quedev=iif(fildev=3,"!","")+cual
endif
@ ren,col say ttdev
return fildev=1
