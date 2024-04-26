********************************************************************************
*-- Programa: FACTURA.PRG
*-- Fecha   : 02-10-92 10:45am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE FACTURAS
********************************************************************************
EXTERNAL REPORT LFACIAA
ulpr=PROGRAM()
PAGPOP=.T.
=OPPAG()

=OPCIU()
=OPVIA()
=OPCCH()
=OPCCL()
DO OPCAJ
=OPMER()
=OPKAR()
=OPCLI()
DO OPREM
=OPFAC()
=OPPRO()
=cabpan1()
DO CASE
CASE BAR()=1
   DO FACD WITH .T.
CASE BAR()=3
   DO FACD
CASE BAR()=4
   DO CKAR
CASE BAR()=6
	=OPRUB()
   =FACGRL(5,30)
   on sele popu nadax do lfacP1 with 'FA'
   acti popu nadax
   rele popu nadax
CASE BAR()=7
	=OPRUB()
   =FACGRL(5,30)
   on sele popu nadax do lfaci1 WITH 'FA'
   acti popu nadax
   rele popu nadax
CASE BAR()=9
	=OPFAC()
	DO rndx WITH 10,30
	ON SELE POPU rndx DO XFAC
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
UNLO ALL
RETURN
