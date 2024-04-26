********************************************
*-- Programa: OPGRU.PRG
*-- Fecha   : 11-21-91 10:51am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO GRUPOS DE COMPRA
********************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG GRUTEX
ELSE
	=MEN_LIN(ABA+"Grupos de Compra")
	SELE 1
	USE (PATH+'\MIXTA') ORDER TAG GRUTEX ALIAS MIX
ENDIF
RETURN IIF(GRUPOP,DEFPOMIX(GRUPOPR,GRUPOPC),.T.) .AND. MEN_LIN(BOTOM)
