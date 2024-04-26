****************************************
*-- Programa: OPAUT.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE AUT
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER O_REOP,O_EXCL
IF O_REOP
	=REOPXXX("AUT")
ELSE
	IF O_EXCL
		IF USED("AUT")
			USE IN AUT
		ENDIF
	ENDIF
ENDIF
=MEN_LIN(ABA+"AUTORIZACION")
=IIF(USED("AUT"),.T.,GETDBF('AUTORIZ',.F.,"AUT",PRXAREA(.T.),O_EXCL))
SELE AUT
RETURN MEN_LIN(BOTOM)
