****************************************
*-- Programa: XRUB.PRG
*-- Fecha   : 06/07/91
*-- Version : V.LEEGSTRA
*-- Notas   : RESTAURA BASE DE RUBROS
*-- VERSION NOVOGAR
*-- MODIFICACION GOYO 06-02-93 09:42pm
***************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
	stor "" TO tx
	SELE rub
		=MEN_LIN('Generando Nuevo Indice de Rubros')
		=FLOCK("rub") .OR. flok("rub")
		=OPRUBX()
		=dotalk()
		INDE ON RUBRO TAG RUBRO FOR EMPTY(CODSRUB)
		INDE ON RUBRO TAG SUBRUBRO FOR .NOT.EMPTY(CODSRUB)
		INDE ON STR(CODRUB) TAG CODRUB FOR EMPTY(CODSRUB)
		INDE ON STR(CODSRUB) TAG CODSUB FOR .NOT.EMPTY(CODSRUB)
		INDE ON STR(CODRUB)+STR(CODSRUB) TAG TODOS
   		INDE ON PALISTAR TAG PALISTAR
		=REOPRUB()
		=untalk()
    tx='INDEXA '
	=IIF(EMPTY(TX),"",iaud('Rubros'))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
