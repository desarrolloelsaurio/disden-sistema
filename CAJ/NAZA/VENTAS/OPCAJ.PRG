*************************************
*-- PROGRAMA: OPCAJ.PRG
*-- FECHA   : 01-21-93 04:55PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO DE CAJA
*************************************
PARAMETER SHIT
IF !USED("CAJ")
	=MEN_LIN(ABA+"Caja")
	SELE 17
	USE (PATH+'\CAJA') ORDER TAG CAJA ALIAS CAJ
ENDIF
=MEN_LIN(BOTOM)
RETURN
