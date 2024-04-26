*********************************************************************************
*-- Programa: MERCAD.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU de mercader¡as
*--           Modificado 03-18-92 11:37am
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
*********************************************************************************
ulpr=hora_ulp(program())
=cabpan1()
=OPPRO()
DO CASE
CASE BAR()=1
   cx=15
	=OPRUB()
	=OPMAR()
   =OPMER()
   DO grl1 WITH 4,15,'Men£ de Productos'
   ON SELE POPU grl DO mer
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
	=OPRUB()
	=OPMAR()
   =OPMER()
   respuesta='grl#5#15#Men£ de Precios#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista \<por Pantalla#-#Res\<taura el Archivo'
	=DEFPOP()
   ON SELE POPU grl DO pre
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=3
	=OPRUB()
   =OPMER()
   respuesta='grl#5#15#Men£ de Precios#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista \<por Pantalla#-#Res\<taura el Archivo'
	=DEFPOP()
   ON SELE POPU grl DO STO
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=4
   STORE nul TO RESPUESTA
   IF !empty(eliemp("a Ingresar",-1,1))
		=OPRUB()
      =OPMER() with jannro
      =OPKAR() WITH JANNRO
      DO IREMx
   ENDIF
CASE BAR()=5
   respuesta='nada#5#20#Kardex#3#\<Operaciones de Kardex#\<Kardex'
	=DEFPOP()
   ON SELE POPU nada DO kardex
   ACTI POPU nada
   RELE POPU nada
ENDCASE
=men_lin(botom)
RETURN
