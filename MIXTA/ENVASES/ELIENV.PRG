********************************************************************************
*-- Programa: ELIENV.PRG
*-- Fecha   : 12/07/91
*-- Version : V.LEEGSTRA
*-- Notas   : ELIGE ENVASES
*-- Modif.  : GOYO 05-30-92 08:02pm ELIMIX
********************************************************************************
FUNCTION eliENV
PARA msg,r1,c1
SELE mix
IF ENVpop
   Set order to TAG envtex
   ACTI POPUP mixpop
   STOR !EMPTY(respuesta) TO respuesta
ELSE
	 RESPUESTA=ELIMIX1('ENVASE '+MSG,'MIX','ENVCOD')
ENDIF
RETURN respuesta
