function qw_BAN
parameter ren,col,cual
private ren,col,cual
if filBAN=1
   STORE SPACE(20) TO RESPUESTA
   if !EMPTY(ELIBAN('a Listar',ren,col))
      ttBAN='Banco '+alltrim(MIX.TEXTO1)+" N§"+alltrim(MIX.TEXTO2)
      queBAN=" '"+STR(MIX.NU1,2)+"'="+cual
      @ REN,COL say ttBAN
   else
      store 2 to filBAN
   endif
endif
return .F.
