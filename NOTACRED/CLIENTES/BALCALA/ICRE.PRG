********************************************************************************
*-- Programa: ICRE.PRG
*-- Fecha   : 08/11/91 02:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE NOTAS DE CREDITO
********************************************************************************
=HORA_ULP()
ulpr=PROGRAM()
DO CASE
CASE BAR()=1
   DO ICRE2
CASE BAR()=2
   DO ICRE3
CASE BAR()=3
   DO ICRE1
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
