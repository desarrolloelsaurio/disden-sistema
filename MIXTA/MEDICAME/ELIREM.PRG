********************************************************************************
*-- Programa: ELIREM.PRG
*-- Fecha   : 09-26-92 02:29am
*-- Version : G. REINER
*-- Notas   : ELIGE MEDICAMENTO
*-- Modif.  : GOYO 05-30-92 08:02pm ELIMIX
********************************************************************************
FUNCTION eliREM
PARA msg,r1,c1
SELE mix
IF REMpop
	 Set order to TAG REMtex
   ACTI POPUP MIXpop
   STOR respuesta#0 TO respuesta
ELSE
	 RESPUESTA=ELIMIX1('MEDICAMENTO'+MSG,'MIX','REMCOD')
ENDIF
RETURN respuesta
