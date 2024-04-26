function qw_gas
parameter ren,col,cosa
private ren,col,cosa
if filgas=2
   store nul to respuesta
   if !empty(eligas("a Listar",ren,col))
      ttgas='Tipos de Gasto: '+alltrim(mix.texto1)
      store cosa+'="'+left(mix.texto2,11)+'"' to quegas
      @ ren,col say alltrim(mix.texto1)
   else
      store 1 to filgas
   endif
endif
return FILGAS=1
