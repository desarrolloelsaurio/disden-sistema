********************************************************************************
*-- Programa: ELIACT.PRG
*-- Fecha   : 03/22/92
*-- Version : V.LEEGSTRA
*-- Notas   : ELIGE EL IMPUESTO
*--           Modificaci¢n GOYO 04-20-92 02:56pm
*-- Modif.  : GOYO 05-30-92 08:54pm ELIMIX
********************************************************************************
FUNCTION eliIMP
PARA msg,r1,c1
SELE mix
store NUL to respuesta
IF IMPpop
   SET ORDER TO TAG IMPTEX
   ACTI POPUP mixpop
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Impuesto '+MSG,'MIX','IMPCOD')
ENDIF
RETURN respuesta
