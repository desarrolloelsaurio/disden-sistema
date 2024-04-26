*:*********************************************************************
*-- Programa: REC.prg
*-- Fecha   : 11-18-91 02:59pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE REMITOS PROVEEDORES
*:**********************************************************************
=cabpan1()
DO oppec
=OPPRO()
DO OPEMP
=OPMER()
=OPMAR()
DO OPPEC
DO OPFAR
DO oprec
=OPKAR()

c1=1
c2=22
c3=53
c4=64
DO CASE
CASE BAR()=1
   IF elipec()
      DO irecp
   ENDIF
CASE BAR()=2
   DO IREC
CASE BAR()=4
	=lRec(.t.)
case bar()=5
	=lRec()
CASE BAR()=7
   ulpr='XREC'
   DO rndx WITH 9,30
   ON SELE POPU rndx DO xREC
   ACTI POPU rndx
   RELE POPU rndx
CASE BAR()=8
   =OPREQ()
   =OPPRO()
   DO REQ.SPR
ENDCASE
ulpr=PROGRAM()
RETURN men_lin(botom)
