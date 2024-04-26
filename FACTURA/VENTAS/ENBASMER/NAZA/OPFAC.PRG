********************************************************************************
*-- Programa: OPFAC.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
*-- PARAMETRO TRUCHO 14.12.92
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
parameter shit
IF ESOPEN("Facturas",9,"FAX")
	USE (PATHVEN+'\FACTUDAT') ORDER TAG FACTURA ALIAS fax
ENDIF
IF ESOPEN("",8,"FAC")
	USE (PATHVEN+'\FACTURA') ORDER TAG FACTURA ALIAS fac
ENDIF
RETURN MEN_LIN(BOTOM)

