****************************************
*-- Programa: XVIA.PRG
*-- Fecha   : 06/12/91 04:10pm
*-- Version : R. 'EL BATA'
*-- Notas   : RESTAURA BASE DE VIAJANTES
*-- Modificacion GOYO 06-02-93 09:48pm
*****************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STOR "" TO TX
	=DOTALK()
	IF USED("VIA")
		SELE VIA
		=men_lin('Generando Nuevo Indice de '+biajas)
		=FLOCK("VIA") .OR. FLOK("VIA")
		USE
	ENDIF
	DO OPVIAX
	SELE VIA
	INDE ON CODVIA TAG CODVIA
	INDE ON VIAJANTE TAG VIAJANTE
	IF SSTM1#'HOGAR'
		DO XVIX
	ENDIF
	UNLO IN VIA
	=REOPVIA()
	=UNTALK()
	=IAUD("RECONSTRUYE INDICE")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
