*************************************
*-- Programa: XCOR.PRG
*-- Fecha   : 06/29/91 09:43am
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DE CORTE
*************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
		=men_lin('Generando Nuevo Indice de Ordenes de '+korte)
		=FLOCK("COR") .or. FLOK("COR")
		=FLOCK("CO1") .or. FLOK("CO1")
		=DOTALK()
		=OPCORX()
		SELE COR
		INDE ON NUMERO TAG NUMERO
		INDE ON NUMERO TAG TERMINAD
		INDE ON NUMERO TAG NOTERMIN
		INDE ON NUMERO TAG INICIADO
		INDE ON NUMERO TAG NOINI
		INDE ON ARTICULO TAG ARTICULO
		SELE CO1
		INDE ON NUMERO TAG NUMERO
		=REOPCOR()
		=UNTALK()
	=IAUD('INDEXA')
ELSE
	=IAUDI()
ENDIF
RETURN
