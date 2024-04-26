*********************************************************************************
*-- Programa: VARI.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
=cabpan1()
DO CASE
CASE BAR()=1
   DO acpopu
CASE BAR()=2
   DO acancho
CASE BAR()=3
   DO achoja
CASE BAR()=4
   DO acdigi
CASE BAR()=5
   DO acaus
CASE BAR()=6
   DO xanum
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
