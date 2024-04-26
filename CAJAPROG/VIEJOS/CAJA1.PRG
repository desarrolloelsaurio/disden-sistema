*********************************************************************************
*-- Programa: CAJA1.prg
*-- Fecha   : 04-11-92 12:28pm
*-- Version : G. REINER
*-- Notas   : DERIVA A INGRESOS, EGRESOS Y CORRECCIONES DE CAJA
********************************************************************************
ulpr=program()
=CABPAN1()
DO CASE
   respuesta='CAJA2#4#43#Gesti¢n de Ingreso de Caja#3#\<Ingresa Efectivo#Lista \<Por Pantalla#Lista Por \<Impresora'
	=DEFPOP()
   ON SELE POPU nada1 DO ing
   ACTI POPU nada1
   RELE POPU nada1
ENDCASE
=MEN_LIN(BOTOM)
RETURN
