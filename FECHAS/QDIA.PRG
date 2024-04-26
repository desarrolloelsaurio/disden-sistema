function qdia
parameter el_dia
PRIVATE EL_DIA
if type("el_dia")="D"
   el_dia=dow(el_dia)
endif
return(iif(el_dia=1,'Domingo',iif(el_dia=2,'Lunes',iif(el_dia=3,'Martes',iif(el_dia=4,'Mi‚rcoles',iif(el_dia=5,'Jueves',iif(el_dia=6,'Viernes','S bado')))))))
