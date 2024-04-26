parameter ren,col,cual
private ren,col,cual
if filpin=2
   ttpin="Inquilinos"
   qqpin="left("+cual+",1)='I'"
endif
if filpin=3
   ttpin="Propietarios"
   qqpin="left("+cual+",1)='P'"
endif
@ ren,col say ttpin
return .T.
