***********************************
*-- Programa: OPCAJ.PRG
*-- Fecha   : 09/03/91 06:22pm
*-- Version : G. RENER
*-- Notas   : ABRE ARCHIVO DE CAJA
***********************************
PARA SHIT
IF !USED("CAJ")
	=MEN_LIN(ABA+"Caja")
	SELE 17
	USE (pathcaj+'\CAJA') ALIAS caj
ENDIF
=MEN_LIN(BOTOM)
RETU
