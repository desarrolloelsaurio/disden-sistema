function qw_bco
parameter ren,col,cual
private ren,col,cual
if filbco#1
   STORE SPACE(20) TO RESPUESTA
   respuesta=PREGUNTA("Banco a Listar",.T.,10,30,'@!')
   if !empty(respuesta)
      ttbco='Banco '+alltrim(respuesta)
      quebco=" '"+alltrim(respuesta)+"' $ "+cual
      @ ren,col say ttbco
   else
      store 1 to filbco
   endif
endif
return FILBCO=1 .or. (fiLBCO#2 .and. !EMPTY(RESPUESTA))
