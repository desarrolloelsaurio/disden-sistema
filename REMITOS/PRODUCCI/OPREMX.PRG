*****************************************************************************
*-- Programa: OPREMX.PRG
*-- Fecha   : 07/04/91 10:57am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO REMITOS
********************************************************************************
SELE 11
	USE (PATHPRO+'\REMITDAF') ALIAS rex EXCL
SELE 10
	USE (PATHPRO+'\REMITOF') ALIAS rem EXCL
RETURN MEN_LIN(BOTOM)
