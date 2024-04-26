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
	respuesta='grl#5#35#Men£ de Costos#3#\<Ingresa Costos#\<Corrige Costos#-#\<Actualiza Costos#-#Lista \<por Pantalla#\<Lista por Impresora'
	=DEFPOP()
	ON SELE POPU grl DO cos
	ACTI POPU grl
	RELE POPU grl
CASE BAR()=3
	=OPMAR()
	=OPRUB()
	=OPMER()
	respuesta='grl#5#35#Men£ de Precios#3#\<Ingresa Precios#\<Corrige Precios#-#\<Actualiza Precios#-#Lista \<por Pantalla#\<Lista por Impresora'
	=DEFPOP()
	ON SELE POPU grl DO pre
	ACTI POPU grl
	RELE POPU grl
CASE BAR()=4
	=OPRUB()
	=OPMAR()
	DO OPCOL
	=OPMER()
	respuesta='grl#5#35#Men£ de Stock#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista \<por Pantalla#-#Res\<taura el Archivo'
	=DEFPOP()
	ON SELE POPU grl DO STO
	ACTI POPU grl
	RELE POPU grl
CASE BAR()=5
	DO OPPOL
	DO PPRE
ENDCASE
=MEN_LIN(BOTOM)
RETURN
