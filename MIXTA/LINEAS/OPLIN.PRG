**************************************
*-- Programa: OPLIN.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE LINEAS
**************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG LINTEX
ELSE
	=MEN_LIN(ABA+"L¡neas")
	SELE 1
	USE (pathPRO+'\MIXTA') ORDER TAG LINTEX ALIAS MIX
ENDIF
RETURN IIF(LINPOP,DEFPOMIX(LINPOPR,LINPOPC),.T.) .AND. MEN_LIN(BOTOM)
