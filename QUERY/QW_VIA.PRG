function qw_via
parameter ren,col,cual
private ren,col,cual
if filvia=2
   store nul to respuesta
   if !empty(elivia('a Listar',ren,col))
      store cual+'="'+via.CODvia+'"' to quevia
      ttvia=biaja+':'+ALLTRIM(via.viajantE)
      acti wind win
      @ ren,col say left(ttvia,20)
   else
      store 1 to filvia
   endif
endif
return FILVIA=1
