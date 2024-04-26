********************************************************************************
*-- Programa: caja.prg
*-- Fecha   : 01-27-92 02:47am
*-- Version : G. REINER
*-- Notas   : deriva a operaciones de caja
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
=OPCLI()
=OPCCH()
DO OPCAJ
DO CASE
CASE BAR()=1
   respuesta='NADA1#4#43#Listados de Ingreso de Caja#3#\<Por Pantalla#Por \<Impresora'
	=DEFPOP()
   ON SELE POPU nada1 DO ling
   ACTI POPU nada1
   RELE POPU nada1
case bar()=2
	 do senia
ENDCASE
ulpr=PROGRAM()
@ 24,nul say botom
UNLO ALL
RETURN
