function qw_TALS
parameter ren,col,cual
private ren,col,cual
if filTAL=2
   STORE SPACE(20) TO RESPUESTA
   if !EMPTY(ELITALS('a Listar',ren,col))
      tTTAL='TALLER '+alltrim(ALLTRIM(PER.CODCLI)+'-'+ALLTRIM(PER.CLIENTE))
      queTAL=cual+"='"+PER.CODCLI+"'"
      @ REN,COL say LEFT(PER.CLIENTE,20)
   else
      store 1 to filTAL
   endif
endif
return FILTAL=1
