*****************************************
*-- Programa: opemp.prg
*-- Fecha   : 06/07/91 06:14pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE EMPRESA
*****************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG MARTEX
ELSE
	=MEN_LIN(ABA+"Empresa")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG MARTEX ALIAS MIX
ENDIF
RETURN IIF(JANPOP,DEFPOMIX(MARPOPR,MARPOPC),.T.) .AND. MEN_LIN(BOTOM)
