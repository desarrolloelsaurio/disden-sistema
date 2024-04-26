parameter ren,col,cual
private ren,col,cual
if filmon#1
   STORE nul TO RESPUESTA
   respuesta=PREGUNTA("Monto a Listar",.f.,14,2,'99999999.99')
   if !empty(respuesta)
      ttmon='Montos '+iif(filmon=2,'Men','May')+'ores a '+alltrim(str(respuesta,14,2))
      quemon=cual+iif(filmon=2,'<','>')+alltrim(str(respuesta))
      @ ren,col say ttmon
   else
      store 1 to filmon
   endif
endif
return .T.
