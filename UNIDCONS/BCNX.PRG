*****************************************************************
*-- Programa: BCNX.PRG
*-- Fecha   : 01-18-92 09:26am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA PARA BORRAR DE LA BASE DE DATOS DE UNIDADES
*****************************************************************
ULPR=PROGRAM()
=HORA_ULP()
DO CASE
CASE BAR()=1
   DO BCNX1
CASE BAR()=2
   DO BCNX2
ENDCASE
RETURN
