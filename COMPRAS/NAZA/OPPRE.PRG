*:************************************
*-- Programa: OPPRE.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO PRECIOS
*:***********************************
IF !USED("PRE")
	=MEN_LIN(ABA+"Precios")
	SELE 15
	USE (PATHVEN+'\PRECIOS') INDEX (PATHVEN+'\PRECIOS') ALIAS PRE
ENDIF
RETURN  MEN_LIN(BOTOM)
