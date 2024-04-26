*************************************
*-- Programa: OPREM.PRG
*-- Fecha   : 07/04/91 10:57am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO REMITOS
*************************************
IF !USED("REX")
	=MEN_LIN(ABA+"Remitos")
	SELE 11
	USE (PATHVEN+'\REMITDAT') ORDER TAG REMITO ALIAS REX
ENDIF
IF USED("REM")
	SELE REM
ELSE
	=MEN_LIN(ABA+"Remitos")
	SELE 10
	USE (PATHVEN+'\REMITO') ORDER TAG REMITO ALIAS REM
ENDIF
=MEN_LIN(BOTOM)
RETURN
