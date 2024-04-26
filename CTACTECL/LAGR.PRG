****************************************************
*-- Programa: LAGR.PRG
*-- Fecha   : 09-05-92 02:41pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE FACTURAS AGRUPADAS
*****************************************************
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
PARAMETER PORPAN
PRIVATE PORPAN
STORE '' TO TT
STORE BAR() TO DIJO
FISC=QWCLI(DIJO)
IF FISC#".F."
   tt="Listado de Cuenta Corriente - Facturas Agrupadas"+crlf+tt
   =IIF(PORPAN,LAGRP(),LAGRI())
ENDIF
RETURN MEN_LIN(BOTOM)
