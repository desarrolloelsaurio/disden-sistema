***********************************************
*-- PROGRAMA: CEXI.PRG
*-- FECHA   : 09/19/91 10:52AM
*-- VERSION : G. REINER
*-- NOTAS   : DERIVA A CALCULO DE PROYECCIONES
***********************************************
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
   DO CEXIP
CASE BAR()=2
   DO CEXII
ENDCASE
RETURN MEN_LIN(BOTOM)
