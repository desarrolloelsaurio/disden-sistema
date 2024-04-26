******************************************************************
*-- Programa: uni.PRG
*-- Fecha   : 06/13/91 05:02pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE UNIDADES DE FRACCIONAMIENTO
******************************************************************
ulpr=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
   DO IUNI
CASE BAR()=3
   DO LUNIP
ENDCASE
UNLO ALL
return MEN_LIN(BOTOM)
