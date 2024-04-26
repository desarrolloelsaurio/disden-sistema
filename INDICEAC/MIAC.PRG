*******************************************************************************
*-- Programa: MIAC.PRG
*-- Fecha   : 04/15/92 12:22pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA INDICES
********************************************************************************
function miAC
parameter cosa
private cosa, RENIAC
ACTI WIND win
clea
@ 1,2 SAY "CODIGO" COLO SCHE 3
@ 2,2 SAY "A¥O" COLO SCHE 3
FOR RENIAC=1 TO 12
  @ RENIAC+2,2 SAY UPPER(QMES(RENIAC))  COLO SCHE 3
ENDF
if cosa
M.NADA=IIF(XSEEK(indice(14),'MIX','ACTCOD'),MIX.TEXTO1,SPACE(15))
@ 1,COL GET m.nada
@ 2,COL GET INDICE(13) pict '9999'
=AR_GET(@INDICE,1,12,1,1,3,col,'99999999.999')
CLEAR GETS
endif
RETURN .t.
