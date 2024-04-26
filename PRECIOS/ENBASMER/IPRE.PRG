********************************************************************************
*-- Programa: iPRE.PRG
*-- Fecha   : 08/26/91 11:28am
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE ingreso de precios
********************************************************************************
ulpr=hora_ulp(program())
IF CHEQSEG()
	DO CASE
	CASE BAR()=1
		DO IPREG
	CASE BAR()=2
		DO grl2 WITH 9,38,'L¡mites de la Generalizaci¢n'
		ON SELE POPU NADA DO IPRET
		ACTI POPU NADA
		RELE POPU NADA
	CASE BAR()=3
		DO iprel
	ENDCASE
ELSE
	=IAUDI()
ENDIF
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
