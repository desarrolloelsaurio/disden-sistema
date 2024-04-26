********************************************************************************
*-- Programa: Mtix.PRG
*-- Fecha   : 01-18-92 09:28am
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA DATOS UNIDADES
********************************************************************************
function MTIX
para convaria
ACTI WIND win1
@ 1,2 SAY "CONSORCIO"    COLO SCHE 3
@ 2,2 SAY "TIPO UNIDAD"  COLO SCHE 3
@ 3,2 SAY "TIPO GASTO"   COLO SCHE 3
@ 4,2 SAY "PORCIENTO"    COLO SCHE 3
if convaria
   m.nada = CNS.CONSORCIO
   @ 1,COL GET m.nada
   CLEAR GETS
   if XSEEK(m.unicod,"MIX","TIPCOD")
      m.nada = mix.texto1
      @ 2,COL get m.nada
      CLEAR GETS
   endif
   @ 3,COL SAY SAYMIX(M.GASCOD,'GASCOD')
   @ 4,COL get m.porcentaje pict "999.99 %"
   CLEAR GETS
ENDIF
RETURN
