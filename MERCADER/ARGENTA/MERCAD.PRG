*********************************************************************************
*-- Programa: MERCAD.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
   =CABPAN1()
   =OPMER()
	=OPRUB()
   do opVAR
   DO OPCAL
   do grl with 6,18,'Gesti¢n de Mercader¡a Gravada '
   ON SELE popu grl DO mer
   ACTI popu grl
   rele popu grl
CASE BAR()=2
   =CABPAN1()
   =OPMER()
	=OPRUB()
   do opVAR
   DO OPCAL
   do grl with 6,18,'Gesti¢n de Mercader¡a Exenta '
   ON SELE popu grl DO mere
   ACTI popu grl
   rele popu grl
CASE BAR()=3
   =OPMER()
   =OPPRO()
	=OPRUB()
	=OPOPK()
   do grl with 6,18,'Gesti¢n de Operaciones de Kardex'
   on sele popu grl do opk
   ACTI popu grl
   rele popu grl
CASE BAR()=4
   =OPMER()
	=OPRUB()
	=OPOPK()
   =OPKAR()
   respuesta='ALGO#6#28#Gesti¢n de Kardex#3;
#P\<erdidos por Repaso;
#-;
#Listado de Existencia \<Pantalla;
#Listado de Existencia \<Impresora;
#-;
#\<Reindexa Archivo'
   =defpop()
   ON SELE popu ALGO DO kar
   ACTI popu ALGO
   rele popu ALGO
ENDCASE
=men_lin(botom)
RETURN
