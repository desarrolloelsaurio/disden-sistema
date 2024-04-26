******************************************************************************
*-- Programa: PEDIDO.PRG
*-- Fecha   : 11-03-91 02:01am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE NOTAS DE PEDIDO
*-- Modificaci¢n GOYO 08-06-92 05:02pm
******************************************************************************
=OPCLI()
DO OPSUE
=OPVIA()
=OPMER()
DO oppre
=OPCIU()
DO OPEMP
=OPPAG()

DO opped
ulpr=HORA_ULP(PROGRAM())
c1=1
c2=17
c3=49
c4=61
c5=72
store nul to m.pedido,m.marca
DO CASE
CASE BAR()=1
	do iped
CASE BAR()=2
	IF busped()
		=MOVEWINN(nul,nul,24,79,'WIN2')
		DO zped
		=RELEWIN("win2")
	ENDIF
CASE BAR()=4
=cligrl(9,50,'L¡mites del Borrado de Notas de Pedido',.t.)
on sele popu cligrl do bped
acti popu cligrl
rele popu cligrl
CASE BAR()=6
 	respuesta='nad#8#35#Tipo de Listado#3#\<Listados#\<Qui‚n Pidi¢ ?'
	=DEFPOP()
 	on sele popu nad do lped with .f.
 	acti popu nad
 	rele popu nad
CASE BAR()=7
 	respuesta='nad#8#35#Tipo de Listado#3#\<Listados#\<Qui‚n Pidi¢ ?'
	=DEFPOP()
 	on sele popu nad do lped with .t.
 	acti popu nad
 	rele popu nad
case bar()=9
	ulpr='XPED'
	DO rndx WITH 16,20
	ON SELE POPU rndx DO xPED
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
