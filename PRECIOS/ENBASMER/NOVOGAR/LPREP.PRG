********************************************************************************
*-- Programa: LPREP
*-- Fecha   : 05-18-92 02:23pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO BASE POR PANTALLA
*** VERSION NOVOGAR
*-- Modificaci¢n GOYO 07-02-92 12:18pm
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()

	#DEFINE NUL    0                               && NUL
	#DEFINE BOTOM  "  "+repl("°",78)               && BOTOM

	=WORKING()
	TTU=TT
	STORE 1 TO LACOSA
	ACLA=HAZ_ACLA()
	IF VARIABLE[CANT_MAX]
		LALISTA='PRECIO'+ALLTRIM(STR(SOBRECUAL))
	ENDIF
	LNS=REPL("=",LEN(ACLA))
	STORE "" TO ELCORTE,ELRUBRO,ELSUBRUBRO
	=LPRE0()
	=WIN0()
	PAG=1
	=CABPAN()
	STOR NUL TO CASOS
	GO TOP
	=LPRE3()
	SCAN
		IF ELCORTE#PALISTAR
			IF !FIN_LNS(1,NUL)
				EXIT
			ENDIF
			CLEA
			PAG=PAG+1
			=CABPAN()
			=LPRE3()
		ENDIF
		IF ROW()>21
			IF !FIN_LNS(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LNS(2)
		ENDIF
		=LPRE1()
	ENDSCAN
	=FIN_LNS(2,CASOS)
	=RELEWIN("WIN")
	=IAUD(FISC)
	SELE MER
	=REOPMER()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

