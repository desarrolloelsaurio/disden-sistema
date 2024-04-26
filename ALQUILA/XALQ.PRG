*************************************
*-- Programa: XALQ.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE ALQTA
**************************************
PROCEDURE XALQ
	ULPR=HORA_ULP(PROGRAM())
	IF CHEQSEG()
		DO OPALQ
		SELE ALQ
		=men_lin('Reindexando el Archivo')
		=FLOCK("ALQ") .OR. FLOK("ALQ")
		=DOTALK()
		=OPALQX()
		pack memo
		INDE ON CODINM TAG CODINM
		INDE ON CODCLI TAG CODCLI
		TX='CREA INDICE '
		=REOPALQ()
		SET ORDER TO TAG CODINM
		SELE INM
		SET RELA TO CODINM INTO ALQ 
		=UNTALK()
		=IAUD(TX)
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
