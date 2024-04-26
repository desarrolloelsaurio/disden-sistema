***********************************
*-- Programa: OPREM.PRG
*-- Fecha   : 01-25-93 05:53pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO REMESAS
**********************************
PARAMETER CHIT
IF USED("REM")
	SELE REM
ELSE
	=MEN_LIN(Aba+"Remesas")
	sele 10
	USE (PATH+'\REMESA') ORDER TAG REMESA ALIAS REM
ENDIF
=MEN_LIN(BOTOM)
RETURN
