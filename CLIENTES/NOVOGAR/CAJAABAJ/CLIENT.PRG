*********************************************************************************
*-- Programa: client.prg
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
PARAMETER COLUCLI
PRIVATE COLUCLI
M.COLUCLI=IIF(EMPTY(PARAMETER()),20,M.COLUCLI)
ulpr=HORA_ULP(PROGRAM())
=cabpan1()
DO CASE
CASE BAR()=1
	=OPCIU()
   DO OPZON
	=OPCLI()
   DO grl3 WITH 4,COLUCLI+5,'Men£ Administrativo de Clientes'
   ON SELE POPU grl DO cli
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
=OPPRV()
	=OPCIU()
	=OPCLI()
   respuesta='grl#4#'+STR(COLUCLI+5)+'#Legajo de Clientes#3#\<Ingresa / Modifica#-#\<Borra un Legajo#Borra \<Todos los Legajos#-#Lista \<por Pantalla#\<Lista por Impresora'
=DEFPOP()
   ON SELE POPU grl DO clij
   ACTI POPU grl
   RELE POPU grl
ENDCASE
=men_lin(botom)
RETURN
