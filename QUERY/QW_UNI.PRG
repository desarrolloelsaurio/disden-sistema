parameter ren,col,cual
private ren,col,cual
if filUNI#1
   ttUNI='Unidades '+iif(filUNI=2,'Alquiladas ','Vac¡as ')
   queUNI=iif(filUNI=2,'!','')+'empty('+cual+')'
   @ ren,col say ttUNI
endif
return .T.
