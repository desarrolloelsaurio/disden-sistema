*******************************************************************************
*-- Programa: lprei1.prg
*-- Fecha   : 09/11/91 05:10pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE lista de precios por pantalla
*-- VERSION BALCALA
*******************************************************************************
=HORA_ULP()
tt='Todos los Precios'
FISC=QWMER(BAR())
IF FISC#".F."
   do ipret1
ENDIF   
unlo all
=men_lin(botom)
RETURN
