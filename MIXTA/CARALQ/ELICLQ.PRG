********************************************************************************
*-- Programa: ELICLQ.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ELIGE LA CARGO POR ALQUILER
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliCLQ
PARA msg,r1,c1
SELE mix
IF CLQpop
   SET ORDER TO TAG CLQTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Cargo por Gesti¢n '+msg,'MIX','CLQCOD')
ENDIF
RETURN respuesta
