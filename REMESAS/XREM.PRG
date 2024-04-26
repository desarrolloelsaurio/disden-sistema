********************************************************************************
*-- Programa: XREM.PRG
*-- Fecha   : G. REINER
*-- Version : 06-02-93 07:53pm
*-- Notas   : RESTAURA BASE DE REMESAS
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO tx
	SELE REM
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Archivo de Remesas')
		=FLOcK("REM") .or. flok("REM")
		=dotalk()
		=opREMx()
		SELE REM
		REINDEX
		=reopREM()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice de Remesas')
		=FLOcK("REM") .or. flok("REM")
		=dotalk()
		=OPREMX()
		SELE REM
		INDEX ON PROVEEDOR+STR(REMESA) TAG REMESA
		INDEX ON MERCA+AGOTADA TAG REMMER
		INDEX ON PROVEEDOR+STR(REMESA)+MERCA TAG ARTICULO
		=REOPREM()
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	IF tx#''
		DO iaud WITH tx+' Remesas'
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN
