************************************************************
*-- Programa: OPFABHIS.PRG
*-- Fecha   : 07-14-94 02:48pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ORDENES DE FABRICACION HISTORICAS
************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
PARAMETER O_EXCL,O_REOP
IF USED("FAXHIS")
	IF O_EXCL
		USE IN FAXHIS
	ELSE
		IF O_REOP
			=REOPXXX("FAXHIS")
		ENDIF
	ENDIF
ENDIF
IF !USED("FAXHIS")
	=MEN_LIN(ABA+"Ordenes de "+favri+" Hist¢ricas")
	=PRXAREA(.T.)
	IF O_EXCL
		USE (PATH+'\OFDATHIS') ORDER TAG NUMERO ALIAS FAXHIS EXCL
	ELSE
		USE (PATH+'\OFDATHIS') ORDER TAG NUMERO ALIAS FAXHIS
	ENDIF
ENDIF
RETURN MEN_LIN(BOTOM)
