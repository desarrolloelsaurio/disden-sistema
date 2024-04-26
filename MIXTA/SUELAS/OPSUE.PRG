****************************************
*-- Programa: OPSUE.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE SUELAS
*-- Modificaci¢n GOYO 03-22-93 03:40am
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG SUETEX
ELSE
	=MEN_LIN(ABA+ZUELAS)
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG SUETEX ALIAS MIX
ENDIF
RETURN IIF(SUEPOP,DEFPOMIX(SUEPOPR,SUEPOPC),.T.)  .AND. MEN_LIN(BOTOM)
