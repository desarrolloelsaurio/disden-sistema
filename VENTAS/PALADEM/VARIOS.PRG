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
*-- 6  Proveedores
*-- 7  Provincias
*-- 8  Rubros
*-- 9  BIAJAS
*-- 10 Zonas
*-- 11  Zonas de BIAJAS
*--
*-- 13 Control Impresoras
*-- 14 Env¡a Mensaje
********************************************************************************
=cabpan1()
DO CASE
case bar()=1
   do opban
  DO ban
CASE BAR()=2
		 =OPPRV()
	=OPCIU()
   DO grl1 WITH 4,5,'Men£ de Ciudades'
   ON SELE POPU grl DO ciu
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=3
	=OPPAG()

   DO grl1 WITH 5,5,'Men£ de Condiciones de Venta'
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
	=OPCIU()
   =OPPRO()
   DO grl1 WITH 7,5,'Men£ de Proveedores'
   ON SELE POPU grl DO pro
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=7
	=OPPRV()
   DO PRV
CASE BAR()=8
	=OPRUB()
   DO RUB.SPR
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
   DO zon
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
=OPCIMP()
CASE BAR()=14
DO SEND
ENDCASE
RETURN men_lin(botom)
