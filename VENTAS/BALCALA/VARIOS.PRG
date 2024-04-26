*********************************************************************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*-- 1  Bancos
*-- 2  Ciudades
*-- 3  Condiciones de Venta
*-- 4  I. V. A.
*-- 5  Marcas
*-- 6  Provincias
*-- 7  Proveedores 08-31-92 11:38am
*-- 8  Rubros
*-- 9  BIAJAS
*-- 10 Zonas
*-- 11 Zonas de BIAJAS
*--
*-- 13 Control Impresoras
*-- 14 Env¡a Mensaje
********************************************************************************
=cabpan1()
DO CASE
case bar()=1
   do opban
   DO grl1 WITH 4,5,'Men£ de Bancos'
   ON SELE POPU grl DO ban
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
		 =OPPRV()
	=OPCIU()
   DO grl1 WITH 4,5,'Men£ de Ciudades'
   ON SELE POPU grl DO ciu
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=3
	=OPPAG()

   respuesta='grl#5#5#Men£ de Condiciones de Venta#3#\<Ingresa#\<Corrige#-#\<Lista por Impresora#Lista \<por Pantalla#-#Posici¢n de \<Ventanas'
		 =DEFPOP()
   ON SELE POPU grl DO pag
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=4
   DO acciva
CASE BAR()=5
	=OPMAR()
   DO grl1 WITH 7,5,'Men£ de Marcas'
   ON SELE POPU grl DO mar
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=6
	=OPPRV()
   DO grl1 WITH 7,5,'Men£ de Provincias'
   ON SELE POPU grl DO prv
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=7
	 =OPCIU()
	 =OPPRV()
	 =OPPRO()
   respuesta='PROV#8#5#Men£ de Proveedores#3#\<Datos Administrativos#\<Legajo'
	=DEFPOP()
   ON SELE POPU prov DO provee
	 acti popu prov
	 rele popu prov
CASE BAR()=8
	=OPRUB()
   DO grl1 WITH 7,5,'Men£ de Rubros'
   ON SELE POPU grl DO rub
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=9
	=OPCIU()
   DO opzon
	 DO OPEMP
	=OPVIA()
   DO grl1 WITH 7,5,'Men£ de '+biajas
   ON SELE POPU grl DO via
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=10
   DO opzon
   DO grl1 WITH 7,5,'Men£ de Zonas'
   ON SELE POPU grl DO zon
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=11
	=OPCIU()
   DO opzon
	 DO OPEMP
   DO opzon
	=OPVIA()
   respuesta='grl#8#5#Men£ de Zonas de los '+biajas+'#3#\<Ingresa#\<Corrige#-#\<Borra#-#\<Lista por Impresora#'
   respuesta=respuesta+'Lista \<por Pantalla#-#Posici¢n de \<Ventanas#-#Res\<taura el Archivo'
	=DEFPOP()
   ON SELE POPU grl DO vix
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=13
   respuesta='grl#10#5#Men£ de Control de Impresi¢n#3#\<Imprime Planilla#Impresi¢n al \<Server#Impresi¢n \<Local#\<Detiene Impresora#Impresi¢n en \<Archivo ASCII'
	=DEFPOP()
   ON SELE POPU grl DO cimp
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=14
DO SEND
ENDCASE
=men_lin(botom)
RETURN
