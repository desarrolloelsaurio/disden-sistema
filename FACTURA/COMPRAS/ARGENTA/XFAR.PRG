********************************************************************************
*-- Programa: XFAR.PRG
*-- Fecha   : 09-04-92 01:35am
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE FACTURAS DE COMPRA
********************************************************************************
PROCEDURE XFAR
	Ulpr=hora_ulp(PROGRAM())
	STORE "" TO TX
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo de Facturas de Compra')
		=FLOK("FAR") .or. lok("FAR")
		=FLOK("FAD") .or. lok("FAD")
		=dotalk()
		=opFARx()
		REINDEX
		=reopFAR()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice de Facturas de Compra')
		=FLOK("FAR") .or. lok("FAR")
		=FLOK("FAD") .or. lok("FAD")
		=dotalk()
		=OPFARX()
		SELE FAR
		INDE ON FACTURA+procod TAG FACTURA OF (pathpro+'\FACTURAc')
		INDE ON MES TAG ELMES OF (pathpro+'\FACTURAc') UNIQ
		SELE FAD
		INDE ON FACTURA TAG FACTURA OF (pathpro+'\FACTUDAc')
		=REOPFAR()
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	IF !empty(TX)
		=IAUD(TX)
	ENDIF
RETURN
