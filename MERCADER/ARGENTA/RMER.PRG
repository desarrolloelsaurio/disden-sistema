********************************************************************************
*-- Programa: mer.prg
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE repeticion de mercaderias
********************************************************************************
DO CASE
CASE BAR()=1
   DO rmer1
CASE BAR()=2
   do rmer2
ENDCASE
ulpr=PROGRAM()
@ 24,0 SAY SPACE(80)
return
