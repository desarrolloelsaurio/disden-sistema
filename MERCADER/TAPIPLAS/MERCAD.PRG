*******************************************************************************
*-- Programa: MERCAD.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
	=OPRUB()
	do opsru
	=OPMAR()
	do opcol
	=OPPRO()
	=OPMER()
	DO grl1 WITH 4,35,'Men£ de Productos'
	ON SELE popu grl DO mer
	ACTI popu grl
	rele popu grl
CASE BAR()=2
	=OPMAR()
	=OPRUB()
	=OPMER()
	respuesta='grl#5#25#Men£ de Precios#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista \<por Pantalla#-#Res\<taura el Archivo'
	=DEFPOP()
	ON SELE POPU grl DO pre
	ACTI POPU grl
	RELE POPU grl
CASE BAR()=3
	=OPRUB()
	=OPMAR()
	DO OPCOL
	=OPMER()
	respuesta='grl#5#25#Men£ de Stock#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista \<por Pantalla#-#Res\<taura el Archivo'
	=DEFPOP()
	ON SELE POPU grl DO STO
	ACTI POPU grl
	RELE POPU grl
CASE BAR()=4
	=OPMAR()
	=OPRUB()
	=OPMER()
   respuesta='grl#4#35#Legajo de Mercader¡a#3#\<Ingresa / Modifica#-#\<Borra un Legajo#Borra \<Todos los Legajos#-#Lista \<por Pantalla#\<Lista por Impresora'
=DEFPOP()
   ON SELE POPU grl DO merj
   ACTI POPU grl
   RELE POPU grl
ENDCASE
=MEN_LIN(BOTOM)
RETURN
