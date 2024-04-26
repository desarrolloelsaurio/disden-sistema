********************************************************************************
*-- Programa: ELISAN.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ELIGE SANATORIO
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliSAN
PARA msg,r1,c1
SELE PER
IF SANpop
   SET ORDER TO TAG SANATORI
   ACTI POPUP PERPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Sanatorio '+msg,'PER','SANCOD')
ENDIF
RETURN IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)
