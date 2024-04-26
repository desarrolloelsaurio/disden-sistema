********************************************************************************
*-- Programa: XREC.PRG
*-- Fecha   : 09-02-92 01:21pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE REMITOS DE COMPRA
*-- VERSION BALCALA
********************************************************************************
PROCEDURE XREC
	Ulpr=hora_ulp(PROGRAM())
	IF CHEQSEG()
		STORE "" TO TX
		SELE MIX
		DO CASE
		CASE BAR()=1
			=men_lin('Reindexando el Archivo de Remitos de Proveedores')
			=FLOCK("REC") .or. FLOK("REC")
			=FLOCK("RE1") .OR. FLOK("RE1")
			=dotalk()
			=oprecx(jannro)
			SELE REC
			REINDEX
			SELE RE1
			REINDEX
			=reoprec()
			=untalk()
			TX='REINDEX '
		CASE BAR()=2
			=men_lin('Generando Nuevo Indice de Remitos de Proveedores'))
			=FLOCK("REC") .or. FLOK("REC")
			=FLOCK("RE1") .OR. FLOK("RE1")
			=dotalk()
			=OPrecX(jannro)
			sele rec
			INDE ON remito+procod tag remito
			sele re1
			INDE ON remito+procod tag remito
			=REOPrec()
			=untalk()
			TX='CREA INDICE '
		ENDCASE
		=IIF(EMPTY(TX),"",IAUD(TX)+"Rem. COMPRA")
	ELSE
		=IAUDI()
	ENDIF
RETURN
