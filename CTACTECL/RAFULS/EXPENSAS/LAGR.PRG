*********************************************************************************
*-- Programa: LAGR.PRG
*-- Fecha   : 09-05-92 02:41pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE FACTURAS AGRUPADAS
********************************************************************************
parameter porpan
private porpan
STORE '' TO TT
STORE BAR() TO DIJO
FISC=QWCLI(DIJO)
IF FISC#".F."
    FISC=qw_fisc(FISC,'LEFT(PER.CODCLI,1)="C"')
    tt="Listado de Cuenta Corriente - Facturas Agrupadas"+chr(13)+chr(10)+tt
	=IIF(PORPAN,LAGRP(),LAGRI())
ENDIF
RETURN MEN_LIN(BOTOM)
