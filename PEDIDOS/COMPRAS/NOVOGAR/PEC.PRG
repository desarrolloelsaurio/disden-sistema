*:*********************************************************************
*-- Programa: PEC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE NOTAS DE PEDIDO PROVEEDORES
*-- Modificaciones GOYO 08-12-92 10:23am
*-- Modificaciones GOYO 02-05-93 03:57pm
*:**********************************************************************
=cabpan1()
DO OPPEC
=OPPRO(.t.)
DO OPEMP
=OPPAG()

=OPMAR()
=OPRUB()
=OPMER()
c1=1
c2=22
c3=53
c4=64
DO CASE
CASE BAR()=1
   DO ipec
CASE BAR()=2
if elipec()
   DO zpec
endif
CASE BAR()=4
   IF elipec()
      DO cpe1
   ENDIF
CASE BAR()=5
   IF elipec()
      DO cier_PEC
   ENDIF
case bar()=7
	=lpec(.t.)
case bar()=8
	=lpec()
CASE BAR()=10
   ulpr='XPEC'
   DO rndx WITH 9,40
   ON SELE POPU rndx DO xPEC
   ACTI POPU rndx
   RELE POPU rndx
CASE BAR()=11
   DO REQ.SPR
CASE BAR()=12
  DO REQ_mer.SPR
ENDCASE
ulpr=PROGRAM()
USE IN PER
RETURN MEN_LIN(BOTOM)
