********************************************************************************
*-- Programa: XFAB.PRG
*-- Fecha   : 09-18-92 03:49pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE FACTURAS DE VENTA
*-- VERSION NAZA
********************************************************************************
PROCEDURE XFAB
	Ulpr=hora_ulp(PROGRAM())
	IF CHEQSEG()
		STORE "" TO TX
		DO OPFAB
		DO OPREM
		SELE FAX
			=men_lin('Generando Nuevo Indice')
			=FLOCK("FAX") .or. FLOK("FAX")
			=FLOCK("REM") .or. FLOK("REM")
			=FLOCK("REX") .or. FLOK("REX")
			=OPFABX()
			=OPREMX()
			=dotalk()
			SELE FAX
			INDE ON TALLER TAG TALLER
			INDE ON NUMERO TAG NUMERO
			INDE ON REMITO TAG REMITO
			INDE ON NUMERO TAG NUMTRU For TIPO="@"
			INDE ON REMITO TAG REMTRU For TIPO="@"
			INDE ON STR(NUMERO)+STR(POSIC) TAG ORDEN For TIPO="@"
			=REOPFAB()
			SELE REM
			INDEX ON REMITO TAG REMITO
			INDEX ON NUMOT TAG NUMOT
			SELE REX
			INDEX ON REMITO TAG REMITO
			=REOPREM()
			=untalk()
		    =iaud('INDEX FABRICACION')
	ELSE
		=IAUDI()
	ENDIF
RETURN
