********************************************************************************
*-- Programa: OPFAC.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
********************************************************************************
PARAMETER SHIT
IF ESOPEN("Facturas",9,"FAX")
	USE (PATHVEN+'\FACTUDAT') order tag factura ALIAS fax
ENDIF
IF ESOPEN("Facturas",8,"FAC")
	USE (PATHVEN+'\FACTURA') order tag FACTURA ALIAS fac
ENDIF
=MEN_LIN(BOTOM)
RETURN