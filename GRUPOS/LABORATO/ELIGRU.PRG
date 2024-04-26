********************************************************************************
*-- Programa: ELIGRU.PRG
*-- Fecha   : 10-11-92 01:02pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL TIPO DE PRACTICA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliGRU
PARA msg,r1,c1
SELE mix
IF GRUpop
   SET ORDER TO TAG GRUTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Provincia '+msg,'MIX','GRUCOD')
ENDIF
RETURN(respuesta)
