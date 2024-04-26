**************************************
*-- Programa: OPTHI.PRG
*-- Fecha   : 19/02/96 12:02
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO HIJOS TELAS MADRE
**************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF A_REOP
	=REOPXXX("THI")
ENDIF
IF USED("THI")
	IF A_EXCL
		USE IN THI
		=PRXAREA(.T.)
		USE (PATHPRO+"\TELHIJOS") ORDER TAG CODMADRE ALIAS THI EXCL
	ELSE
		SELE THI
	ENDIF
ELSE
	=MEN_LIN(ABA+"Tela Madre")
	=PRXAREA(.T.)
	IF A_EXCL
		USE (PATHPRO+"\TELHIJOS") ORDER TAG CODMADRE ALIAS THI EXCL
	ELSE
		USE (PATHPRO+"\TELHIJOS") ORDER TAG CODMADRE ALIAS THI
	ENDIF
ENDIF
RETURN .T.
