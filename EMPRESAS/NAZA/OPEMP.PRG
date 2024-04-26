****************************************
*-- Programa: OPEMP.PRG
*-- Fecha   : 06/07/91 06:14pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE MARCAS
****************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG MARTEX
ELSE
	=MEN_LIN(ABA+"Marcas")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG MARTEX ALIAS MIX
ENDIF
IF MARPOP
	=DEFPOMIX(MARPOPR,MARPOPC)
ENDIF
RETURN MEN_LIN(BOTOM)
