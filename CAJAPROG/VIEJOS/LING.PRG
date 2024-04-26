********************************************************************************
*-- Programa: LING.PRG
*-- Fecha   : 01-27-92 07:32pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE INGRESOS DE CAJA
********************************************************************************
ulpr=PROGRAM()
DO CASE
CASE BAR()=1
   respuesta='NADAcli#6#34#Listados de Ingreso de Caja por Pantalla#3#\<Todos los Clientes#\<Un Cliente#\<Resumen por Cliente'
	=DEFPOP()
   ON SELE POPU nadacli DO lingp
   ACTI POPU nadacli
   RELE POPU nadacli
case bar()=2
   respuesta='NADAcli#6#34#Listados de Ingreso de Caja por Pantalla#3#\<Todos los Clientes#\<Un Cliente#\<Resumen por Cliente'
	=DEFPOP()
   ON SELE POPU nadacli DO lingi
   ACTI POPU nadacli
   RELE POPU nadacli
ENDCASE
ulpr=PROGRAM()
@ 24,nul say botom
RETURN
*: EOF: FAC.PRG
