*********************************************************************************
*-- Programa: kardex.prg
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
   DO opopk
   DO grl1 WITH 4,35,'Men£ de Operaciones de Kardex'
   ON SELE popu grl DO opk
   ACTI popu grl
	rele popu grl
CASE BAR()=2
	do opopk
	=OPMER()
	=OPKAR()
RESPUESTA='Grl#4#30#Men£ de Kardex#3;
#\<Ingresa Operaci¢n;
#-;
#\<Borra;
#\<Calcula Saldos;
#-;
#\<Lista por Impresora;
#Lista \<por Pantalla;
#-;
#Posici¢n de \<Ventanas;
#-;
#Res\<taura el Archivo;
#Ve\<rifica Consistencia'
=DEFPOP()
  ON SELE popu grl DO kar
  ACTI popu grl
 rele popu grl
ENDCASE
=men_lin(botom)
RETURN
