********************************************************************************
*-- Programa: XKAR.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MIXTA
********************************************************************************
PROCEDURE XKAR
	Ulpr=hora_ulp(PROGRAM())
	if cheqseg()
		STORE "" TO TX
		SELE MIX
		DO CASE
		CASE BAR()=1
			=men_lin('Reindexando el Archivo de Kardex')
			=FLOCK("KAR") .or. FLOK("KAR")
			=dotalk()
			=opKARX()
			REINDEX
			=reopKAR()
			=untalk()
			TX='REINDEX '
		CASE BAR()=2
			=men_lin('Generando Nuevo Indice de Kardex')
			=FLOCK("KAR") .or. FLOK("KAR")
			=dotalk()
			=OPKARX()
			SELE KAR
			INDE ON ARTICULO+DTOS(FECHAOP) TAG ARTICULO
			INDE ON CLIENTE+STR(REMESA)+ARTICULO TAG REMESA  FOR !LIQUIDA .AND. PROVEEDOR
			=REOPKAR()
			=untalk()
			TX='CREA INDICE '
		ENDCASE
		=IIF(EMPTY(TX),"",iaud('KARDEX'))
	else
		=iaudi()
	endif
RETURN
