***********************************
*-- Programa: OPFCO.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CONTROL
*--           DE FACTURAS DE TALLERES
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
PARAMETER A_REOP,A_EXCL
IF A_REOP
	=REOPXXX("FCO")
ENDIF
IF USED("FCO")
	IF A_EXCL
		USE IN FCO
		USE (PATHPRO+"\CONTRFAC") ORDER TAG NUMERO ALIAS FCO EXCL		
	ELSE
		SELE FCO
	ENDIF
ELSE
	=MEN_LIN(ABA+" Control de Facturas")
	=PRXAREA(.T.)
	IF A_EXCL
		USE (PATHPRO+"\CONTRFAC") ORDER TAG NUMERO ALIAS FCO EXCL
	ELSE
		USE (PATHPRO+"\CONTRFAC") ORDER TAG NUMERO ALIAS FCO
	ENDIF
ENDIF
RETURN MEN_LIN(BOTOM)
