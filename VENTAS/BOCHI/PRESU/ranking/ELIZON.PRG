********************************************************************************
*-- Programa: ELIZON.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE LA ZONA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION elizon
PARA msg,r1,c1
SELE mix
IF zonpop
   SET ORDER TO TAG ZONTEX
   ACTI POPUP MIXpop
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Zona '+msg,'MIX','ZONCOD')
ENDIF
RETURN respuesta
