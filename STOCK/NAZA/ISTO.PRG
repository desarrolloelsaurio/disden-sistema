********************************************************************************
*-- Programa: iPRE.PRG
*-- Fecha   : 08/26/91 11:28am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de Stocks
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO CASE
	CASE BAR()=1
		DO iStog
	CASE BAR()=2
		DO grl2 WITH 9,38,'L¡mites de la Generalizaci¢n'
		ON SELE POPU nada DO iStot
		ACTI POPU nada
		RELE POPU nada
	CASE BAR()=3
		DO iStol
	ENDCASE
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)