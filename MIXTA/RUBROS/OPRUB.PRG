*****************************************
*-- Programa: OPRUB.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE RUBROS
*-- Modificaci¢n GOYO 03-22-93 03:37am
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG RUBTEX
ELSE
	=MEN_LIN(ABA+"Rubros")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG RUBTEX ALIAS MIX
ENDIF
RETU IIF(RUBPOP,DEFPOMIX(RUBPOPR,RUBPOPC),.T.) .AND. MEN_LIN(BOTOM)
