********************************************************************************
*-- Programa: XFAR.PRG
*-- Fecha   : 09-25-92 06:37pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE FACTURAS DE COMPRA
*-- VERSION BALCALA
********************************************************************************
PROCEDURE XFAR
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	SELE MIX
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo de Facturas de Proveedores')
		=FLOK("FAR") .or. lok("FAR")
		=FLOK("FAD") .OR. LOK("FAD")
		=dotalk()
		=opFARx(jannro)
		SELE FAR
		REINDEX
		SELE FAD
		REINDEX
		=reopFAR()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice de Facturas de Proveedores'))
		=FLOK("FAR") .or. lok("FAR")
		=FLOK("FAD") .OR. LOK("FAD")
		=dotalk()
		=OPFARX(jannro)
		sele FAR
		cosa=q_arc("FAR")
		INDE ON FACTURA+procod tag FACTURA of (PATHCPR+'\'+cosa)
		sele FAD
		cosa=q_arc("FAD")
		INDE ON FACTURA+procod tag factura of (PATHCPR+'\'+cosa)
		=REOPFAR()
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN
