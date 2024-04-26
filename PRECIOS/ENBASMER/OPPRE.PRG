********************************************************************************
*-- Programa: OPPRE.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO PRECIOS
********************************************************************************
IF ESOPEN("Precios",15,"PRE")
	USE (PATHVEN+'\PRECIOS') INDEX (PATHVEN+'\PRECIOS') ALIAS pre
ENDIF
RETURN MEN_LIN(BOTOM)
