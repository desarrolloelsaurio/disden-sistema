*********************************************************************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
=CABPAN1()
DO CASE
case bar()=1
   do opCal
   DO grl1 WITH 4,5,'Men£ de Calidades/Tama¤os'
   ON SELE POPU grl DO cal
   ACTI POPU grl
   RELE POPU grl
case bar()=2
	=OPPRV()
	=OPCIU()
   DO grl1 WITH 4,5,'Men£ de Ciudades'
   ON SELE POPU grl DO ciu
   ACTI POPU grl
   RELE POPU grl
case bar()=3
   DO oppag
   DO grl1 WITH 5,5,'Men£ de Condiciones de Venta'
   ON SELE POPU grl DO pag
   ACTI POPU grl
   RELE POPU grl
case bar()=4
   DO opban
   DO grl1 WITH 5,5,'Men£ de Bancos'
   ON SELE POPU grl DO ban
   ACTI POPU grl
   RELE POPU grl
case bar()=5
	=OPRUB()
   DO grl1 WITH 4,5,'Men£ de Especies'
   ON SELE POPU grl DO RUB
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=6
   do acciva
CASE BAR()=7
	=OPCIU()
	=OPPRV()
   DO grl1 WITH 5,5,'Men£ de Provincias'
   ON SELE POPU grl DO prv
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=8
   DO openv
   DO grl1 WITH 6,5,'Men£ de Tipos de Envase'
   ON SELE POPU grl DO env
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=9
   DO opvar
   DO grl1 WITH 6,5,'Men£ de Tipos o Variedades'
   ON SELE POPU grl DO var
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=10
   DO opzon
   DO grl1 WITH 6,5,'Men£ de Zonas'
   ON SELE POPU grl DO zon
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=11
	=OPVIA()
   respuesta='viajan#8#5#Gesti¢n de Vendedores#3#\<Datos Administrativos#\<Legajo del Vendedor'
   =defpop()
   ON SELE popu viajan DO viajan
	 acti popu viajan
	 rele popu viajan
CASE BAR()=12
	=OPGAS()
   DO grl1 WITH 6,5,'Men£ de Gastos'
   ON SELE POPU grl DO gas
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=14
   DO LISTAR
ENDCASE
=MEN_LIN(BOTOM)
RETURN
