********************************************************************************
*-- Programa: ELIOPK.PRG
*-- Fecha   : 04-30-92 12:21pm
*-- Version : G. REINER
*-- Notas   : ELIGE LA OPERACION DE KARDEX
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION eliopk
PARA msg,r1,c1
priv msg,r1,c1
SELE mix
store NUL to respuesta
IF opkpop
   SET ORDER TO TAG opkTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
	 RESPUESTA=ELIMIX1('Operaci¢n '+msg,'mix','opkcod')
ENDIF
RETURN respuesta
