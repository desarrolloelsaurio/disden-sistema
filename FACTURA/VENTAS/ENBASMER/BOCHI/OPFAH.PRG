********************************************************************************
*-- Programa: OPFAH.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS facturas historico
*-- PARAMETRO TRUCHO 14.12.92
*-- Modificacion -> abre solo archivo historico, pero con
*-- el alias de facturas.
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
parameter shit
IF ESOPEN("Facturas Históricas",9,"FAX")
	USE (PATHVEN+'\FACTUDAH') ORDER TAG FACTURA ALIAS fax
ENDIF
IF ESOPEN("",8,"FAC")
	USE (PATHVEN+'\FACTURAH') ORDER TAG FACTURA ALIAS fac
ENDIF
RETURN MEN_LIN(BOTOM)

