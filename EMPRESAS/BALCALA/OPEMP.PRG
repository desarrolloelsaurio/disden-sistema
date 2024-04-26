***********************************************
*-- Programa: OPEMP.PRG
*-- Fecha   : 11-21-91 11:21am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MARCAS DE PRODUCTOS
***********************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG JANTEX
ELSE
	=MEN_LIN(ABA+"Empresa")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG JANTEX ALIAS MIX
ENDIF
IF CANT_EMPRE#1
   =DEFPOMIX(JANPOPR,JANPOPC)
ENDIF
=MEN_LIN(BOTOM)
RETURN
