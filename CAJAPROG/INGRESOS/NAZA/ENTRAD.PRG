*********************************************************************************
*-- Programa: ENTRAD.PRG
*-- Fecha   : 11-08-91 12:21pm
*-- Version : G. REINER
*-- Notas   : MENU cuenta corriente de clientes
*respuesta='entrad#2#38#Entradas de Caja#3;
* 1 #Ingreso \<Cobros;
* 2 #\<A Cuenta;
* 3 #-;
* 4 #Ingreso \<Efectivo y cheques;
* 5 #-;
* 6 #Ingresos por \<Pantalla;
* 7 #Ingresos por \<Impresora;
* 8 #-;
* 9 #C. C. Clientes por P\<antalla;
*10 #C. C. Clientes por I\<mpresora;
*11 #-;
*12 #Reimp\<uta pagos'
********************************************************************************
ulpr=program()
=cabpan1()
DO CASE
CASE BAR()=1
	=OPCLI()
	DO OPCAJ
	=OPCCH()
	=OPCCL()
	DO ICOB
CASE BAR()=2
	=OPCLI()
	DO OPCAJ
	=OPCCH()
	=OPCCL()
	DO ICOBO
CASE BAR()=4
	 =OPCCH()
	 =OPGAS()
	DO opcaj
	=OPCLI()
	DO IEFE
case BAR()=6
	DO opcaj
	=OPPRO()
	DO OPBAN
	=OPCLI()
	do lcaj with .t.,'GAS','C'
case BAR()=7
	DO opcaj
	=OPPRO()
	DO OPBAN
	=OPCLI()
	do lcaj with .f.,'GAS','C'
CASE BAR()=9
	=OPCIU()
	=OPCLI()
	=OPCCH()
	=OPCCL()
	=CCLGRL(7,20)
	ON SELE POPU nada DO ctactec1
	ACTI POPU nada
	RELE POPU nada
CASE BAR()=10
	=OPCIU()
	=OPCLI()
	=OPCCH()
	=OPCCL()
	=CCLGRL(7,20)
	ON SELE POPU nada DO ctactec2
	ACTI POPU nada
	RELE POPU nada
CASE BAR()=12
=OPCCL()
=OPCLI()
   respuesta='ALGO#9#20#Tipo de Reimputaci¢n#3;
   #Por \<Factura;
   #Por Fecha de \<Emisi¢n;
   #Por Fecha de \<Vencimiento'
	=DEFPOP()
   ON SELE POPU ALGO DO reimp
   ACTI POPU ALGO
   RELE POPU ALGO
ENDCASE
=MEN_LIN(BOTOM)
RETURN
