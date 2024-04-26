********************************************************************************
*-- Programa: XRUB.PRG
*-- Fecha   : 12/10/91
*-- Version : V.LEEGSTRA
*-- Notas   : RESTAURA BASE DE "RUVROS"
*-- VERSION MERCADO DE VERDURAS
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO tx
	SELE rub
	DO CASE
	CASE BAR()=1
		=MEN_LIN('Reindexando el Archivo de '+ALLTRIM(RuVros))
		=FLOCK("RUB") .OR. flok("rub")
		USE
		=dotalk()
		=OPRUB()X
		REINDEX
		=REOPRUB()
		=untalk()
		tx='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice de '+alltrim(RuVros))
		=FLOCK("RUB") .OR. flok("rub")
		USE
		=dotalk()
		=OPRUB()X
		INDE ON rubro tag rubro
		UNLO IN rub
		tx='CREA INDICE '
	ENDCASE
	=IIF(EMPTY(TX),"",iaud('Rubros'))
ELSE
	=IAUDI()
ENDIF
RETURN
