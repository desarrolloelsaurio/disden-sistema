********************************************************************************
*-- Programa: ELITPR.PRG
*-- Fecha   : 10-11-92 01:02pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL TIPO DE PRACTICA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliTPR
PARA msg,r1,c1
SELE mix
IF TPRpop
   SET ORDER TO TAG TPRTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Provincia '+msg,'MIX','TPRCOD')
ENDIF
RETURN(respuesta)
