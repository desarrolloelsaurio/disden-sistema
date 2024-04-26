********************************************************************************
*-- Programa: XFAC.PRG
*-- Fecha   : 09-18-92 03:49pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE FACTURAS DE VENTA
*-- VERSION NOVOGAR
********************************************************************************
PROCEDURE XFAC
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	SELE FAC
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo')
		=FLOCK("FAC") .or. Flok("FAC")
		=FLOCK("FAX") .or. Flok("FAX")
		=dotalk()
		=opFACx()
		REINDEX
		=reopFAC()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice')
		=FLOCK("FAC") .or. Flok("FAC")
		=FLOCK("FAX") .or. Flok("FAX")
		=dotalk()
		=OPFACX()
		SELE FAC
        INDEX ON FACTURA TAG FACTURA
        INDEX ON CODCLI TAG CODCLI
        SELE FAX
        INDEX ON FACTURA TAG FACTURA
        INDEX ON ARTICULO TAG ARTICULO
		=untalk()
		=REOPFAC()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN
