*****************************************
*-- Programa: OPUNI.PRG
*-- Fecha   : 09-26-92 02:27am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE UNIDADES
*****************************************
IF USED("MIX")
	SELE 1
	SET ORDER TO TAG UNITEX
ELSE
	=MEN_LIN(ABA+"Unidades")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG UNITEX ALIAS MIX
ENDIF
RETURN IIF(UNIPOP,DEFPOMIX(UNIPOPR,UNIPOPC),.T.) .AND. MEN_LIN(BOTOM)
