********************************************
*-- Programa: CCPER.PRG
*-- Fecha   : 11/25/91
*-- Version : G. REINER
*-- Notas   : MENU CUENTA CORRIENTE CLIENTES
********************************************
ulpr=program()
=cabpan1()
DO CASE
CASE BAR()=1
   DO ideb
CASE BAR()=2
   respuesta='nada#5#45#N§ de Cr‚dito de Clientes#3#\<Monto Fijo#Devoluci¢n \<Parcial#Devoluci¢n \<Total'
	=DEFPOP()
   ON SELE POPU nada DO icre
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=4
   respuesta='nada#7#45#Saldos por Pantalla#3#C\<ompleto#Un \<Cliente#Un \<Viajante#Una \<Factura#-#\<Resumen'
	=DEFPOP()
   ON SELE POPU nada DO lcobp
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=5
   respuesta='nada#9#45#Saldos por Impresora#3#Un \<Cliente#Un \<Viajante#Una \<Factura#-#\<Resumen#-#'
   respuesta=respuesta+'Completo \<Interno#Completo para el Cli\<ente#-#\<Vencidas'
	=DEFPOP()
   ON SELE POPU nada DO lcobi
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=7
*** restaura archivo
CASE BAR()=8
*** mantenimiento
ENDCASE
RETURN MEN_LIN(BOTOM)
