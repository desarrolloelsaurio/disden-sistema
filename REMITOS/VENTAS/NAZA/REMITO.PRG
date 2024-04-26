*******************************************************************************
*-- Programa: REMITO.PRG
*-- Fecha   : 12-11-91 02:45pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE REMITOS
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
=OPCLI()
DO opcur
=OPVIA()
=OPMER()
=OPCIU()
DO OPEMP
=OPPAG()

=OPKAR()
DO oppre
DO CASE
CASE BAR()=1
	DO OPPED
	do oprem
	store nul to m.pedido,m.marca
	IF busped()
		DO REMP
	ENDIF
CASE BAR()=2
	DO OPREM
	DO REMD
case bar()=4
	DO OPREM
	do arem
case bar()=6
	do oprem
    do lrem with .f.
case bar()=7
	do oprem
    do lrem with .t.
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
