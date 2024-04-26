********************************************************************************
*-- Programa: ING.PRG
*-- Fecha   : 04-11-92 12:33pm
*-- Version : G. REINER
*-- Notas   : OPERACIONES DE CAJA
********************************************************************************
ulpr=PROGRAM()
DO CASE
CASE BAR()=2
   respuesta='NADAcli#6#34#Listados de Ingreso de Caja por Pantalla#3#\<Todos los Clientes#\<Un Cliente#\<Resumen por Cliente'
	=DEFPOP()
   ON SELE POPU nadacli DO lingp
   ACTI POPU nadacli
   RELE POPU nadacli
case bar()=3
   respuesta='NADAcli#6#34#Listados de Egresos de Caja por Impresora#3#\<Todos los Clientes#\<Un Cliente#\<Resumen por Cliente'
	=DEFPOP()
   ON SELE POPU nadacli DO lingi
   ACTI POPU nadacli
   RELE POPU nadacli
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
