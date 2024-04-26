********************************************************************************
*-- Programa: Btix.PRG
*-- Fecha   : 01-18-92 09:26am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA PARA BORRAR DE LA BASE DE DATOS DE UNIDADES
********************************************************************************
acti scree
ulpr=PROGRAM()
=hora_ulp()
DO CASE
CASE BAR()=1
   DO Btix1
CASE BAR()=2
   DO Btix2
CASE BAR()=3
   DO Btix3
ENDCASE
RETURN
