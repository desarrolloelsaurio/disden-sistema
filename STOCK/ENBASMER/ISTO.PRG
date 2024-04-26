********************************************************************************
*-- Programa: ISTO.PRG
*-- Fecha   : 03-30-92 02:14am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de Stocks
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	DO CASE
	CASE BAR()=1
		DO iStog
	CASE BAR()=2
	FISC=''
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
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
