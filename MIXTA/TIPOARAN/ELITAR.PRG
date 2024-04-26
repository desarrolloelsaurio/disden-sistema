********************************************************************************
*-- Programa: ELITAR.PRG
*-- Fecha   : 09-26-92 02:29am
*-- Version : G. REINER
*-- Notas   : ELIGE TIPO DE UNIDAD
*-- Modif.  : GOYO 05-30-92 08:02pm ELIMIX
********************************************************************************
FUNCTION eliTAR
PARA msg,r1,c1
SELE mix
IF TARpop
 Set order to TAG TARtex
   ACTI POPUP mixpop
   STOR respuesta#0 TO respuesta
ELSE
	 RESPUESTA=ELIMIX1('TIPO DE ARANCEL'+MSG,'MIX','TARCOD')
ENDIF
RETURN respuesta
