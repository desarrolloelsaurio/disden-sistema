*********************************************************************************
*-- Programa: MERCAD.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*-- Modificaci¢n GOYO 05-17-92 06:27pm
********************************************************************************
ulpr=program()
MC_DIJO=ALLTRIM(PROMPT())
=cabpan1()
DO CASE
CASE MC_DIJO='Mercader¡as'
   cx=15
	=OPRUB()
   DO opmat
   DO OPEMP
   DO opsue
   DO oplin
   DO optel
   =OPMER()
   respuesta='grl#4#15#Men£ de Productos#3#\<Ingresa#\<Corrige#-#\<Borra#\<Recupera#Rep\<ite#-#'
   respuesta=respuesta+'\<Lista por Impresora#Lista \<por Pantalla#-#Posici¢n de \<Ventanas#-#Res\<taura el Archivo'
   =DEFPOP()
   ON SELE POPU grl DO mer
   ACTI POPU grl
   RELE POPU grl
CASE MC_DIJO='Stock'
   DO OPSUE
	=OPRUB()
   DO opmat
   DO OPEMP
   DO oplin
   DO optel
   DO oppre
   =OPMER()
   respuesta='grl#5#15#Men£ de Precios#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista \<por Pantalla#-#\<Borra Stock Anterior#-#Res\<taura el Archivo'
=DEFPOP()
   ON SELE POPU grl DO STO
   ACTI POPU grl
   RELE POPU grl
#IF "PROD" $ CURDIR()
CASE MC_DIJO='Precios'
   DO opSUE
	=OPRUB()
   DO opmat
   DO OPEMP
   DO oplin
   DO optel
   DO oppre
   =OPMER()
   respuesta='grl#5#15#Men£ de Precios#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista \<por Pantalla#-#Res\<taura el Archivo#-#Lee de Dis\<kette'
=DEFPOP()
   ON SELE POPU grl DO pre
   ACTI POPU grl
   RELE POPU grl
CASE MC_DIJO='Kardex'
   respuesta='nada#5#15#Kardex#3#\<Operaciones de Kardex#\<Kardex'
   =DEFPOP()
   ON SELE POPU nada DO kardex
   ACTI POPU nada
   RELE POPU nada
CASE MC_DIJO='Ingreso Mercader¡as'
	=OPRUB()
   =OPKAR()
   do oppre
   =OPMER()
   DO IREMX
#ELSE
   CASE MC_DIJO=ABIOS
   DO OPAVI
   respuesta='AVI#5#15;
#Men£ de '+ABIOS+';
#3;
#\<Datos para Producci¢n;
#\<Datos Generales;
#\<Legajo'
=DEFPOP()
   ON SELE POPU avi DO avi1
   ACTI POPU avi
   RELE POPU avi
   CASE MC_DIJO=TELLAS
   DO OPTEL
#ENDIF
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
