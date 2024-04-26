function qw_TAL
parameter ren,col,cual
private ren,col,cual
if filTAL=2
   STORE SPACE(20) TO RESPUESTA
   if !EMPTY(ELITAL('a Listar',ren,col))
      tTTAL='TALLER '+alltrim(ALLTRIM(TAL.TALCOD)+'-'+ALLTRIM(TAL.TALLERES))
      queTAL=cual+"='"+TAL.TALCOD+"'"
      @ REN,COL say LEFT(TAL.TALLERES,20)
   else
      store 1 to filTAL
   endif
endif
return FILTAL=1
