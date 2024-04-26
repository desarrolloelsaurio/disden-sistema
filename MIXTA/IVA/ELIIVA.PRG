********************************************************************************
*-- Programa: ELIIVA.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ELIGE LA Condici¢n de I.V.A.
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliIVA
PARA msg,r1,c1
SELE mix
IF IVApop
   SET ORDER TO TAG IVATEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Condici¢n de I.V.A. '+msg,'MIX','IVACOD')
ENDIF
RETURN respuesta
