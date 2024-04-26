********************************************************************************
*-- Programa: OPMER.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF ESOPEN("Mercader¡as",14,"MER")
	USE (pathpro+'\MERCA') order tag articulo ALIAS mer
ENDIF
IF merpop
	if merpop1
		DEFI POPU merpop FROM merpopr,merpopc PROM FIELD mer.merca MESS ' Elija la Mercader¡a ' SHAD COLOR SCHE 3 IN SCREEN
	else
		DEFI POPU merpop FROM merpopr,merpopc PROM FIELD mer.articulo MESS ' Elija la Mercader¡a ' SHAD COLOR SCHE 3 IN SCREEN
		=OPRUB()
	endif
	ON SELE POPU merpop DO resp1
ELSE
	RELE POPU merpop
ENDIF
RETURN men_lin(botom)
