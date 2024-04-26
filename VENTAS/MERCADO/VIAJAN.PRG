*********************************************************************************
*-- Programa: VIAJAN.PRG
*-- Fecha   : 05/05/92 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VENDEDORES
********************************************************************************
ulpr=program()
=cabpan1()
DO CASE
CASE BAR()=1
   DO OPSEG
   DO OPAUD
	=OPCIU()
   DO OPZON
	=OPVIA()
   DO grl WITH 4,23,'Men£ Administrativo de Vendedores'
   ON SELE POPU grl DO VIA
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
   DO OPSEG
   DO OPAUD
	=OPCIU()
	=OPVIA()
   respuesta='grl#4#22#Legajo de Vendedores#3#\<Ingresa / Modifica#-#\<Borra un Legajo#Borra \<Todos los Legajos#-#Lista \<por Pantalla#\<Lista por Impresora'
   =defpop()
   ON SELE POPU grl DO viaj
   ACTI POPU grl
   RELE POPU grl
ENDCASE
=men_lin(botom)
RETURN
