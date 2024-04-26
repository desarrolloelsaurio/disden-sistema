*************************************
*-- Programa: XCNS.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE CONSORCIOS
**************************************
PROCEDURE XCNS
	ULPR=HORA_ULP(PROGRAM())
	IF CHEQSEG()
		#DEFINE NUL    0                             && NUL
		#DEFINE BOTOM  "  "+repl("°",78)             && BOTOM
		DO OPCNS
		SELE CNS
		=MEN_LIN('Reindexando el Archivo')
		=FLOCK("CNS") .OR. FLOK("CNS")
		=DOTALK()
		=OPCNSX()
		SELE CNS
		INDEX TAG CONSORCIO ON CONSORCIO
		INDEX TAG CONCOD ON CONCOD
		TX='CREA INDICE '
		=REOPCNS()
		=UNTALK()
		=IAUD(TX)
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
