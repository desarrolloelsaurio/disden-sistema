*********************************************
*-- Programa: OPREM.PRG
*-- Fecha   : 09-26-92 02:27am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE MEDICAMENTOS
*-- MODIF GOYO 04-28-93 03:09pm
*********************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG REMTEX
ELSE
	=MEN_LIN(ABA+"Medicamentos")
	SELE 1
	USE (PATH+'\MIXTA') ORDER TAG REMTEX ALIAS MIX
ENDIF
RETURN IIF(REMPOP,DEFPOMIX(REMPOPR,REMPOPC),.T.) .AND. MEN_LIN(BOTOM)
