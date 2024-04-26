********************************************************************************
*-- Programa: XFAC.PRG
*-- Fecha   : 09-18-92 03:49pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE FACTURAS DE VENTA
*-- VERSION NAZA
********************************************************************************
PROCEDURE XFAC
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	SELE FAC
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo')
		=FLOK("FAC") .or. lok("FAC")
		=FLOK("FAX") .or. lok("FAX")
		=dotalk()
		=opFACx()
		REINDEX
		=reopFAC()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice')
		=FLOK("FAC") .or. lok("FAC")
		=FLOK("FAX") .or. lok("FAX")
		=dotalk()
		=OPFACX()
		SELE FAC
		inde on FACTURA TAG FACTURA OF (PATHVEN+'\FACTURA')
		USE
		SELE FAX
		inde on FACTURA TAG FACTURA OF (PATHVEN+'\FACTUDAT')
		USE
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN
RETURN
