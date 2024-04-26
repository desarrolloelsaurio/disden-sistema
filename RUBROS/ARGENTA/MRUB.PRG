********************************************************************************
*-- Programa: MRUB.PRG
*-- Fecha   : 12/10/91
*-- Version : V.LEEGSTRA
*-- Notas   : MUESTRA "RUVROS"
********************************************************************************
PARAMETER COSA
ACTI WIND win
@ 1,2 SAY RUVRO COLO SCHE 3
@ 2,2 SAY "CODIGO " COLO SCHE 3
@ 1,COL GET m->rubro
@ 2,COL GET m->codrub pict "@z 999"
CLEAR GETS
RETURN
*: EOF: MRUB.PRG
