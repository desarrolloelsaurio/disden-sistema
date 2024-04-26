********************************************************************************
*-- Programa: ELIUNI.PRG
*-- Fecha   : 09-26-92 02:29am
*-- Version : G. REINER
*-- Notas   : ELIGE UNIDAD
*-- Modif.  : GOYO 05-30-92 08:02pm ELIMIX
********************************************************************************
FUNCTION eliUNI
PARA msg,r1,c1
SELE mix
IF UNIpop
   Set order to TAG UNItex
   ACTI POPUP MIXpop
   STOR !EMPTY(respuesta) TO respuesta
ELSE
	 RESPUESTA=ELIMIX1('UNIDAD'+MSG,'MIX','UNICOD')
ENDIF
RETURN respuesta
