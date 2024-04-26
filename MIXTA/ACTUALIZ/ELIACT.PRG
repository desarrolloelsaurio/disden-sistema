********************************************************************************
*-- Programa: ELIACT.PRG
*-- Fecha   : 03/22/92
*-- Version : V.LEEGSTRA
*-- Notas   : ELIGE EL ESTADO
*--           Modificaci¢n GOYO 04-20-92 02:56pm
*-- Modif.  : GOYO 05-30-92 08:54pm ELIMIX
********************************************************************************
FUNCTION eliACT
PARA msg,r1,c1
SELE mix
store NUL to respuesta
IF ACTpop
   SET ORDER TO TAG ACTTEX
   ACTI POPUP mixpop
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
 RESPUESTA=ELIMIX1('actualiz. '+MSG,'MIX','ACTCOD')
ENDIF
RETURN respuesta
