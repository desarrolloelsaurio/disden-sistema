********************************************
*-- Programa: OPtar.PRG
*-- Fecha   : 11/08/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO TARJETAS DE CREDITO
*-- Modificaci¢n GOYO 05-16-92 09:29pm
**********************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG TARTEX
ELSE
	=MEN_LIN(ABA+"Tarjetas de Cr‚dito")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG TARTEX ALIAS MIX
ENDIF
RETURN IIF(TARPOP,DEFPOMIX(TARPOPR,TARPOPC),.T.) .AND. MEN_LIN(BOTOM)
