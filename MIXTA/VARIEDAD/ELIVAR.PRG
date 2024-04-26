********************************************************************************
*-- Programa: ELIVAR.PRG
*-- Fecha   : 12/10/91
*-- Version : G. REINER
*-- Notas   : ELIGE TIPO DE VARIEDAD
*-- Modif.  : GOYO 05-30-92 07:32pm ELIMIX
********************************************************************************
FUNCTION eliVAR
PARA msg,r1,c1
SELE mix
IF VARpop
   SET ORDER TO TAG VARTEX
   ACTI POPUP VARpop
   STOR IIF(respuesta#0,RECNO(),0) TO respuesta
ELSE
	 RESPUESTA=ELIMIX1('VARIEDAD '+MSG,'MIX','VARCOD')
ENDIF
RETURN respuesta 
