procedure _f10000
if !pideclav(1)
	return
endif
=opcli()
=opfac()
m.mesanio=mesanio("Período del Listado",.t.,.t.)
if last()#27 .and. confirma("Listado Fact. Mayores a 10000",.t.,20,10)
   =relewin("win")
   m.elmes=val(left(mesanio,2))
   m.elanio=val(right(mesanio,4))
   TT="Facturas Mayores a $ 10,000.00"
   tt1="Del mes de "+qmes(elmes)+" de "+;
   alltrim(str(elanio))
   if type("pormonit")#"U" .and. pormonit
   repo form lfac2 ;
   for month(fac.fechaem)=m.elmes .and. ;
   year(fac.fechaem)=m.elanio .and. fac.montonet>10000 ;
prev
   else
   repo form lfac2 ;
   for month(fac.fechaem)=m.elmes .and. ;
   year(fac.fechaem)=m.elanio .and. fac.montonet>10000 ;
   noconsole ;
   to prin PROMPT
   endif
else
   =relewin("win")
endif
return .t.