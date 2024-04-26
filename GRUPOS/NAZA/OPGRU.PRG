***********************************************
*-- Programa: OPGRU.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE GRUPOS DE COMPRA
***********************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG GRUTEX
ELSE
	=MEN_LIN(ABA+"Grupos de Compra")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG GRUTEX ALIAS MIX
ENDIF
RETURN IIF(GRUPOP,DEFPOMIX(GRUPOPR,GRUPOPC),.T.) .AND. MEN_LIN(BOTOM)
