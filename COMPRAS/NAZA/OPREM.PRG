*:************************************
*-- Programa: OPREM.PRG
*-- Fecha   : 07/04/91 10:57am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO REMITOS
*:************************************
IF !USED("REX")
	=MEN_LIN(ABA+"Remitos")
	SELE 11
	USE (PATHVEN+'\REMITDAT') INDEX (PATHVEN+'\REMITDAT') ALIAS REX
ENDIF
IF !USED("REM")
	SELE 10
	USE (PATHVEN+'\REMITO') INDEX (PATHVEN+'\REMITO') ALIAS REM
ENDIF
=MEN_LIN(BOTOM)
RETURN
