function qw_zon
parameter ren,col,cual
private ren,col,cual
if filzon=2
   store nul to respuesta
   if !empty(elizon("a Listar",ren,col))
      ttzon='Zona: '+alltrim(mix.texto1)
      store cual+'="'+left(mix.texto2,2)+'"' to quezon
      @ ren,col say alltrim(mix.texto1)
   ELSE
      STORE 1 TO FILzon
   endif
endif
return FILzon=1
