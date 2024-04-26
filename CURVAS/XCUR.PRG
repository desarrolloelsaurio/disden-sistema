********************************************************************************
*-- Programa: XCUR.PRG
*-- Fecha   : 06/13/91 03:12pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE Curvas
********************************************************************************
ulpr=HORA_ULP(PROGRAM())
STORE "" TO TX
SELE CUR
DO CASE
CASE BAR()=1
	=MEN_LIN('Reindexando el Archivo de Curvas')
	SELE CUR
	=DOTALK()
	=FLOCK("CUR") .OR. FLOK("CUR")
	USE
	=OPCURX()
	REINDEX
	=UNTALK()
	=REOPCUR()
	TX='REINDEX '
CASE BAR()=2
	=MEN_LIN('Regenerando el Indice de Curvas')
	SELE CUR
	=DOTALK()
	=FLOCK("CUR") .OR. FLOK("CUR")
	USE
	=OPCURX()
	INDE ON CURVA TAG CURVA OF (pathpro+'\CURVAS')
	INDE ON CURVA TAG UNACURVA OF (pathpro+'\CURVAS') UNIQ
	=UNTALK()
	=REOPCUR()
	TX='GENERA  INDICE'
ENDCASE
=IIF(EMPTY(TX),.T.,iaud(TX))
RETURN
