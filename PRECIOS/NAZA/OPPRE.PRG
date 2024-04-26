*****************************************
*-- Programa: OPPRE.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO PRECIOS
*-- Modificaci¢n GOYO 05-16-92 09:29pm
*****************************************
IF USED("PRE")
	SELE PRE
ELSE
	=MEN_LIN(ABA+"Precios")
	SELE 15
	USE (PATHVEN+'\PRECIOS') ORDER TAG ARTICULO ALIAS PRE
ENDIF
=MEN_LIN(BOTOM)
RETURN
