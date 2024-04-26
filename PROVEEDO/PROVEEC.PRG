*********************************************************************************
*-- Programa: provee.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
ulpr=program()
=CABPAN1()
DO CASE
CASE BAR()=1
	=OPCIU()
   =OPPRO()
   DO grl3 WITH 4,15,'Men£ Administrativo de Proveedores'
   ON SELE POPU grl DO pro
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
	=OPCIU()
   =OPPRO()
   respuesta='grl#4#15#Legajo de Proveedores#3#\<Ingresa / Modifica#-#\<Borra un Legajo#Borra \<Todos los Legajos#-#Lista \<por Pantalla#Lista por Impresora'
	=DEFPOP()
   ON SELE POPU grl DO proj
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=3
   DO OPEMP
   =OPMER()
   =OPPRO()
	=OPVIA()
	=OPCIU()
   DO oprem
   DO opfaR
   DO CTACTEP
ENDCASE
=men_lin(botom)
RETURN
