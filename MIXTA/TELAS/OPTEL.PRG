**************************************
*-- Programa: OPTEL.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE TELAS GENERICAS
*-- Modificaci¢n GOYO 30/08/95 15:10 - NAZA
**************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG TELTEX
ELSE
	=MEN_LIN(ABA+"Telas")
	SELE 1
	USE (pathPRO+'\MIXTA') ORDER TAG TELTEX ALIAS MIX
ENDIF
RETURN IIF(TELPOP,DEFPOMIX(TELPOPR,TELPOPC),.T.) .AND. MEN_LIN(BOTOM)
