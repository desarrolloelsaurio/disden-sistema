* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : ENTRAD.PRG                                               �
* � COMENTARIO    : INGRESOS DE CAJA - SISTEMA DE CAJA PUBLICO               �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-22-93                                                    �
* � HORA       : 05:23:52pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
ulpr=program()
=cabpan1()
dijo=bar()
diko=alltrim(prompt())
=OPCIU()
DO CASE
CASE DIKO="Cobro de Expensas"
   DO opcaj
   DO OPCNS
   DO OPCNX
   =OPCLI() WITH "C"
   DO ICOB WITH .T.
   USE IN CNS
   USE IN CNX
CASE DIKO="Cobro de Alquileres"
   STORE .F. TO  AFUTURO
   DO opcaj
   DO OPINM
   DO OPALQ
   DO OPINQ
	=OPCLI()
   DO ICOB WITH .T.
CASE DIKO="Cuenta Corriente Consorcista"
	=OPCIU()
	=OPCLI()
	=OPCCH()
	=OPCCL()
   do lcclu with .t.
CASE DIKO="Cuenta Corriente Propietario"
   DO opcaj
   DO OPCNS
   DO OPCNX
   =OPCLI() WITH "C"
   do lcclu with .t.
CASE DIKO="Cuenta Corriente Inquilino"
   DO opcaj
   DO OPCNS
   DO OPCNX
   =OPCLI() WITH "C"
   do lcclu with .t.
CASE DIKO="Listado de Caja por Pantalla"
   DO opcaj
   =OPPRO()
   DO OPBAN
	=OPCLI()
	respuesta='LCAJ#7#28#Listado de Ingresos de Caja#3;
#\<Ingresos;
#\<Recibos Emitidos'
	=defpop()
	on sele popu lcaj do lcajd with .T.,'GAS','C'
	acti popu lcaj
	rele popu lcaj
CASE DIKO="Listado de Caja por Impresora"
   DO opcaj
   =OPPRO()
   DO OPBAN
	=OPCLI()
	respuesta='LCAJ#7#28#Listado de Ingresos de Caja#3;
#\<Ingresos;
#\<Recibos Emitidos'
	=defpop()
	on sele popu lcaj do lcajd with .f.,'GAS','C'
	acti popu lcaj
	rele popu lcaj
ENDCASE
=MEN_LIN(BOTOM)
RETURN
