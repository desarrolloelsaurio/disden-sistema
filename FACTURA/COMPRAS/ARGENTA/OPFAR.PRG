*:*********************************************************************
*-- Programa: OPFAR.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
*:*********************************************************************
PARAMETER SHIT
IF ESOPEN("Facturas",9,"FAD")
	USE (pathpro+'\FACTUDAC') ORDER TAG FACTURA ALIAS fad
ENDIF
IF ESOPEN("",8,"FAR")
	USE (pathpro+'\FACTURAc') ORDER TAG FACTURA ALIAS far
ENDIF
=MEN_LIN(BOTOM)
RETURN
