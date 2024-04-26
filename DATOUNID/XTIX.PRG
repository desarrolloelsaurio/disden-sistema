********************************************************************************
*-- Programa: XCNX.PRG
*-- Fecha   : 01-18-92 09:28am
*-- Version : R. 'EL BATA'
*-- Notas   : RESTAURA BASE DE unidades
*-- Modificaci¢n GOYO 06-02-93 07:52pm (ERROR EN BLOQUEOS)
********************************************************************************
ulpr=hora_ulp(PROGRAM())
if cheqseg()
	STORE "" TO tx
	SELE CNX
	DO CASE
	CASE BAR()=1
		=men_lin('Reindexando el Tipo de Gastos de Unidades')
		=FLOCK("TIX") .or. FLOK("TIX")
		=dotalk()
		=opTIXx()
		REINDEX
		=reopCNX()
		=untalk()
		TX='REINDEX '
	CASE BAR()=2
		=men_lin('Generando Nuevo Indice de Tipo de Gastos de Unidades')
		=FLOCK("TIX") .or. FLOK("TIX")
		=dotalk()
		=OPTIXX()
		INDE ON CONCOD TAG CONCOD
		INDE ON DENOM  TAG DENOM
		INDE ON CODCLI TAG CODCLI
		=reopCNX()
		=untalk()
		TX='CREA INDICE '
	ENDCASE
	=IIF(EMPTY(TX),"",IAUD(TX+' UNIDADES'))
ELSE
	=IAUDI()
ENDIF
RETURN
