*****************************************************************
*-- Programa: OPCORHIS.PRG
*-- Fecha   : 07-14-94 03:02pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ORDENES DE CORTE y EXTENDED (HISTORICO)
******************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER O_EXCL,O_REOP
IF USED("CORHIS")
   IF O_REOP
	  =REOPXXX("CORHIS")
	ELSE
		IF O_EXCL
			USE IN CORHIS
		ELSE
			SELE CORHIS
		ENDIF
	ENDIF
ENDIF
IF !USED("CORHIS")
=MEN_LIN(ABA+"Ordenes de "+korte+" Hist¢ricas")
=GETDBF('OCHIS','NUMERO','CORHIS',PRXAREA(.T.),O_EXCL)
ENDIF
IF USED("CO1HIS") 
	IF O_REOP
		=REOPXXX("CO1HIS")
	ELSE
		IF O_EXCL
			USE IN CO1HIS
		ENDIF
	ENDIF
ENDIF
IF !USED("CO1HIS")
	=MEN_LIN(ABA+"Ordenes de "+korte+" Hist¢ricas")
	=PRXAREA(.T.)
	IF O_EXCL
		USE (PATH+'\OCDATHIS') ORDER TAG NUMERO ALIAS CO1HIS EXCL
	ELSE
		USE (PATH+'\OCDATHIS') ORDER TAG NUMERO ALIAS CO1HIS
	ENDIF
ENDIF
RETURN MEN_LIN(BOTOM)
