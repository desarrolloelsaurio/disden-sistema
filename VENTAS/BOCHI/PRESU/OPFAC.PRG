********************************************************************************
*-- Programa: OPFAC.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
*-- PARAMETRO TRUCHO 14.12.92
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
parameter shit
IF USED("FAX")
	sele fax
else
	sele 0
	USE (camino2+'\FACTUDAT') ORDER TAG FACTURA ALIAS fax
endif
IF USED("FAC")
	sele faC
else
	sele 0
	USE (camino2+'\FACTURA') ORDER TAG FACTURA ALIAS fac
endif
RETURN MEN_LIN(BOTOM)

