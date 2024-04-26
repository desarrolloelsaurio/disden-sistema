*****************************************
*-- Programa: OPMER.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS
****************************************
#DEFINE BOTOM "  "+repl("°",78)                  && BOTOM
#DEFINE ABA          "Abriendo Base de "         && ABA
PARAMETER SOLOPOP
IF !SOLOPOP
IF !USED("MER")
	=MEN_LIN(ABA+"Mercader¡as")
	SELE 14
	USE (PATHPRO+'\MERCA') ORDER TAG ARTICULO ALIAS MER
ENDIF
ENDIF
IF MERPOP
	=IIF(MERPOP1,;
		DEFPOGRL(MERPOPR,MERPOPC,"MERPOP","MER.MERCA",40,"Elija la mercader¡a"),;
DEFPOGRL(MERPOPR,MERPOPC,"MERPOP","MER.ARTICULO",20,"Elija la mercader¡a"))
ELSE
	RELE POPU MERPOP
ENDIF
RETURN MEN_LIN(BOTOM)
