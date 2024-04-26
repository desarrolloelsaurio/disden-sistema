********************************************************************************
*-- Programa: FACTURA.prg
*-- Fecha   : 11-03-91 02:03am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE FACTURACION
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
=OPCLI()
=OPCCL()
DO opcur
=OPVIA()
=OPMER()
=OPCIU()
DO OPEMP
=OPPAG()

=OPKAR()
DO oppre
DO oprem
=OPFAC()
DO CASE
CASE BAR()=1
	if sucu='0002'
	    DO OPCAJ
		do facxb
	else
		DO facr
	endif
CASE BAR()=2
	if sucu='0002'
	    DO OPCAJ
		DO senia
	ELSE
		do opsue
		DO OPPED
		do facx WITH .T.
		USE IN PED
		USE IN PEX
	ENDIF
case bar()=3
	do opsue
	do facx
CASE BAR()=5
	respuesta='nadax#5#30#Tipo de Listado de Facturas#3#\<Listados#\<Documentaci¢n Emitida#Libro de \<IVA Ventas#\<Ultima Operaci¢n'
	=DEFPOP()
	on sele popu nadax do lfacP1 with 'FA'
	acti popu nadax
	rele popu nadax
case bar()=6
	respuesta='nadax#5#30#Tipo de Listado de Facturas#3#\<Listados#Documentaci¢n \<Emitida#Libro de \<IVA Ventas#\<Ultima Operaci¢n'
	=DEFPOP()
	on sele popu nadax do lfaci1 WITH 'FA'
	acti popu nadax
	rele popu nadax
CASE BAR()=8
	IF ELIFAC()
		if empty(fac.montonet)
			quefac=fac.factura
			registro=str(recno())
			do flok with "fac"
			do flok with "fax"
			sele fac
			dele
			sele fax
			set order to
			dele for fax.factura=quefac
			set order to 1
			unlo in fac
			unlo in fax
		else
			=cartel("La factura N§ "+alltrim(str(quefac)),"no esta vacia",'',"** ES IMPOSIBLE BORRAR **")
		endif
	endif
case bar()=9
	do cont_fac
case bar()=11
	=OPCLI()
	DO OPCAJ
	=OPCCH()
	=OPCCL()
	DO ICOB
case bar()=12
   respuesta='ALGO#9#20#Tipo de Reimputaci¢n#3;
   #Por \<Factura;
   #Por Fecha de \<Emisi¢n;
   #Por Fecha de \<Vencimiento'
	=DEFPOP()
   ON SELE POPU ALGO DO reimp
   ACTI POPU ALGO
   RELE POPU ALGO
case bar()=13
	do xfac
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
