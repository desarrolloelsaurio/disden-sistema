********************************************************************************
*-- Programa: cur.PRG
*-- Fecha   : 06/13/91 12:06pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE CURVAS DE PRODUCCION
********************************************************************************
ulpr=PROGRAM()
=CABPAN1()
SELE CUR
DO CASE
CASE BAR()=1
   DO icur
CASE BAR()=2
   DO ccur
CASE BAR()=4
   DO lcurp
CASE BAR()=6
   ULPR='XCUR'
   DO rndx WITH 14,30
   ON SELE POPU rndx DO xcur
   ACTI POPU rndx
   rele popu rndx
ENDCASE
ulpr=PROGRAM()
unlo all
RETURN MEN_LIN(BOTOM)
