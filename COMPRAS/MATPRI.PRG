*********************************************************************************
*-- Programa: MATPRI.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU DE MATERIAS PRIMAS
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
DO CASE
CASE BAR()=1
   =OPPRO()
   DO opgru
   DO opavi
   respuesta='grl#4#15#Men£ de '+abios+'#3#\<Ingresa#\<Corrige#-#\<Borra#\<Recupera#\<Anula#R\<eemplaza#'
   respuesta=respuesta+'-#\<Lista por Impresora#Lista \<por Pantalla#-#Posici¢n de \<Ventanas#-#Res\<taura el Archivo'
	=DEFPOP()
   ON SELE POPU grl DO avi
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
   =OPPRO()
   DO opgru
   DO optel
   respuesta='grl#4#15#Men£ de '+tellas+'#3#\<Ingresa#\<Corrige#-#\<Borra#\<Recupera#\<Anula#R\<eemplaza#-#'
   respuesta=respuesta+'\<Lista por Impresora#Lista \<por Pantalla#-#Posici¢n de \<Ventanas#-#Res\<taura el Archivo'
	=DEFPOP()
   ON SELE POPU grl DO tel
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=3
   cx=15
	=OPRUB()
   DO opmat
   DO OPEMP
   DO opsue
   DO oplin
   DO optel
   =OPMER()
   DO grl1 WITH 4,15,'Men£ de Productos'
   ON SELE POPU grl DO mer
   ACTI POPU grl
   RELE POPU grl
ENDCASE
=MEN_LIN(BOTOM)
RETURN
*: EOF: MATPRI.PRG
