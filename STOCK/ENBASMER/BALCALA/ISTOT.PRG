********************************************************************************
*-- Programa: ISTOT.PRG
*-- Fecha   : 09/06/91 03:57pm
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE GENERALIZACION DE Stock
*-- VERSION : BALCALA
********************************************************************************
=HORA_ULP(PROGRAM())
TT=''
FISC=QWMER(BAR())
IF FISC#".F."
   DO ISTOT1
ENDIF
unlo all
=men_lin(botom)
RETURN
