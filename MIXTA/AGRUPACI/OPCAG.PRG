******************************************
*-- Programa: OPCAG.PRG
*-- Fecha   : 11-21-91 10:36am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO CONCEPTOS DE AGRUPACION
*-- Modificaci¢n GOYO 10-25-92 05:41pm (lin->cag)
*-- MODIF GOYO 04-28-93 02:48pm
******************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG CAGTEX
ELSE
	=MEN_LIN(ABA+'Agrupaci¢n')
	SELE 1
	USE (PATH+'\MIXTA') ORDER TAG CAGTEX ALIAS MIX
ENDIF
RETURN IIF(CAGPOP,DEFPOMIX(CAGPOPR,CAGPOPC),.T.) .AND. MEN_LIN(BOTOM)
