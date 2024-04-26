*********************************************************************************
*-- Programa: ECAJA.prg
*-- Fecha   : 11/14/91
*-- Version : R. 'EL BATA'
*-- Notas   : MENU EGRESOS CAJA
********************************************************************************
ulpr=program()
=CABPAN1()
DO CASE
CASE BAR()=1
   do ecaj1
CASE BAR()=2
   do ecaj2
CASE BAR()=2
   do ecaj3
ENDCASE
=MEN_LIN(botom)
RETURN
