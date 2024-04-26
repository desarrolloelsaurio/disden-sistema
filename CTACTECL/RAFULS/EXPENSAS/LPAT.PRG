*********************************************************************************
*-- Programa: LPAT.PRG
*-- Fecha   : 09-05-92 02:41pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE ESTADO PATRIMONIAL
********************************************************************************
parameter porpan
private porpan
STORE '' TO TT
STORE BAR() TO DIJO
FISC=QWCLI(DIJO)
IF FISC#".F."
    FISC=qw_fisc(FISC,'LEFT(PER.CODCLI,1)="C"')
    tt="Lista Estado Patrimonial"+chr(13)+chr(10)+tt
	=IIF(PORPAN,LPATP(),LPATI())
ENDIF
RETURN MEN_LIN(BOTOM)
