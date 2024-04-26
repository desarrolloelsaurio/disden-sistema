function qw_cns
parameter ren,col,cual
private ren,col,cual
   if filcns=2
      store nul to respuesta
      if !empty(elicns("a Listar",ren,col))
         ttcns='Consorcio: '+alltrim(cns.consorcio)
         store cual+'="'+alltrim(cns.concod)+'"' to quecns
         @ ren,col say alltrim(cns.consorcio)
     else
         store 1 to filcns
      endif
endif
return FILCNS=1
