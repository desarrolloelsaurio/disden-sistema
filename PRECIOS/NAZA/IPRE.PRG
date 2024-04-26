********************************************************************************
*-- Programa: iPRE.PRG
*-- Fecha   : 08/26/91 11:28am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de precios
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO CASE
	CASE BAR()=1
		DO ipreg
	CASE BAR()=2
		DO grl2 WITH 9,38,'L¡mites de la Generalizaci¢n'
		ON SELE POPU nada DO ipret
		ACTI POPU nada
		RELE POPU nada
	CASE BAR()=3
		DO iprel
	case bar()=4
		do iprex
	case bar()=5
		do iprey
	ENDCASE
ELSE
	=iaudi()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
