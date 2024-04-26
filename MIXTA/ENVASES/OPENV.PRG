**************************************
*-- Programa: OPENV.PRG
*-- Fecha   : 12/07/91
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO DE ENVASES
*-- MODIF GOYO 04-28-93 02:30pm
**************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG ENVTEX
ELSE
	=MEN_LIN(ABA+"Envases")
	SELE 1
	USE (PATH+'\MIXTA') ORDER TAG ENVTEX ALIAS mix
ENDIF
RETURN IIF(ENVPOP,DEFPOMIX(ENVPOPR,ENVPOPC),.T.) .AND. MEN_LIN(BOTOM)
