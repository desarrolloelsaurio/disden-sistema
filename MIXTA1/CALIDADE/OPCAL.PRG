*****************************************
*-- Programa: OPCAL.PRG
*-- Fecha   : 12/07/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CALIDADES
****************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG CALTEX
ELSE
	=MEN_LIN(ABA+"Calidades")
	SELE 1
	USE (PATH+'\MIXTA') ORDER TAG CALTEX ALIAS mix
ENDIF
RETURN IIF(CALPOP,DEFPOMIX(CALPOPR,CALPOPC),.T.) .AND. MEN_LIN(BOTOM)
