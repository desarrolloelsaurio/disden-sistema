*********************************************************************************
*-- Programa: CHEQUE.prg
*-- Fecha   : 11/25/91
*-- Version : V.LEEGSTRA
*-- Notas   : MENU CHEQUES
********************************************************************************
ulpr=program()
=CABPAN1()
DO CASE
CASE BAR()=1
	=OPCCH()
	=OPCLI()
   DO OPEMP
   do opdoc
   DO iche
CASE BAR()=2
	=OPCCH()
	=OPCLI()
   Do cche
CASE BAR()=4
	=OPCCH()
	=OPCLI()
   Do lchep
CASE BAR()=5
	=OPCCH()
	=OPCLI()
   Do lchei
ENDCASE
=men_lin(botom)
RETURN
*: EOF: CHEQUE.PRG
