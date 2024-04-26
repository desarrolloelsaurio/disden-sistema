*********************************************************************************
*-- Programa: MERCA.PRG
*-- Fecha   : 13/12/91
*-- Version : V.LEEGSTRA
*-- Notas   : MENU MERCADERIA
********************************************************************************
ULPR=PROGRAM()
=CABPAN1()
   =OPMER()
	=OPRUB()
   do opVAR
   DO OPCAL
   RESPUESTA='grl#4#35#Men£ de Mercader¡a#3#\<Ingresa#\<Corrige#-#\<Borra#R\<ecupera#\<Repite#-#'
   RESPUESTA=RESPUESTA+'\<Lista por Impresora#Lista \<por Pantalla#-#\<Variables#-#Res\<taura el Archivo'
	=DEFPOP()
   ON SELE popu grl DO mer
   ACTI popu grl
   rele popu grl
@ 24,0 SAY SPACE(80)
RETURN
