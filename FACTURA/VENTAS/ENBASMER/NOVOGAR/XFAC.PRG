*************************************************
*-- Programa: XFAC.PRG
*-- Fecha   : 09-18-92 03:49pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE FACTURAS DE VENTA
*-- VERSION NOVOGAR
*************************************************
FUNCTION XFAC
PARAMETER XEM
	ULPR=HORA_ULP(PROGRAM())
	=CHEQSEG()
	IF !empty(xem) .or. FUERARED()#27
		STORE "" TO TX
		SELE FAC
		=men_lin('Generando Nuevo Indice')
		if empty(xem)
		=FLOCK("FAC") .or. FLOK("FAC")
		USE
		=FLOCK("FAX") .or. FLOK("FAX")
		USE
		=OPFACX()
		else
		sele 0
		use (path+"\"+xem+"\facturas") alias faca EXCL
		sele 0
		use (path+"\"+xem+"\factudat") alias faxa EXCL
		endif
		=dotalk()
		if empty(xem)
		SELE FAC
		else
		sele faca
		endif
		INDEX ON FACTURA TAG FACTURAA FOR LEFT(FACTURA,1)="A"
		INDEX ON FACTURA TAG FACTURAB FOR LEFT(FACTURA,1)="B"
		INDEX ON FACTURA TAG FACTURA
		INDEX ON CODCLI TAG CODCLI
		INDEX ON FECHAEM TAG FECHAEM
		if empty(xem)		
		SELE FAX
		else
		sele faxA
		ENDIF
		INDEX ON FACTURA TAG FACTURAA FOR LEFT(FACTURA,1)="A"
		INDEX ON FACTURA TAG FACTURAB FOR LEFT(FACTURA,1)="B"
		INDEX ON FACTURA TAG FACTURA FOR EMPTY(REMITO)
		INDEX ON REMITO TAG REMITO FOR !EMPTY(REMITO)
		INDEX ON ARTICULO TAG ARTICULO
		=UNTALK()
				if empty(xem)
		=REOPFAC()
		ELSE
		USE IN FACA
		USE IN FAXA
		ENDIF
		=IAUD('CREA INDICE')
	ENDIF
RETURN
