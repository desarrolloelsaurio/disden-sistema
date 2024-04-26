*:*********************************************************************
*-- Programa: PEC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE NOTAS DE PEDIDO PROVEEDORES
*-- Modificaciones GOYO 08-12-92 10:23am
*:**********************************************************************
=cabpan1()
DO oppec
=OPPRO()
DO OPEMP
=OPPAG()

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
case bar()=6
	DO LPEC WITH .T.
case bar()=7
	DO LPEC WITH .T.
CASE BAR()=9
	ulpr='XPEC'
	DO rndx WITH 15,40
	ON SELE POPU rndx DO xPEC
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
