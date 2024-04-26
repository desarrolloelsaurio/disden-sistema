*********************************************************************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
DIJO=ALLTRIM(PROMPT())
=cabpan1()
DO CASE
case DIJO='Bancos'
	do opban
	DO grl1 WITH 4,5,'Men£ de Bancos'
	ON SELE POPU grl DO ban
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Ciudades'
	=OPPRV()
	=OPCIU()
	DO grl1 WITH 4,5,'Men£ de Ciudades'
	ON SELE POPU grl DO ciu
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Condiciones de Venta'
	=OPPAG()

	DO grl1 WITH 4,5,'Men£ de Condiciones de Venta'
	ON SELE POPU grl DO pag
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='I. V. A.'
	DO acciva
CASE DIJO='Marcas'
	=OPMAR()
	DO grl1 WITH 7,5,'Men£ de Marcas'
	ON SELE POPU grl DO mar
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Provincias'
	=OPPRV()
	DO grl1 WITH 7,5,'Men£ de Provincias'
	ON SELE POPU grl DO prv
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Proveedores'
	=OPCIU()
	=OPPRV()
	=OPPRO()
	respuesta='PROV#8#5#Men£ de Proveedores#3#\<Datos Administrativos#\<Legajo'
	=DEFPOP()
	ON SELE POPU prov DO provee
	acti popu prov
	rele popu prov
CASE DIJO='Rubros'
	=OPRUB()
	DO grl1 WITH 7,5,'Men£ de Rubros'
	ON SELE POPU grl DO rub
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Control Impresoras'
	respuesta='grl#10#5#Men£ de Control de Impresi¢n#3#\<Imprime Planilla#Impresi¢n al \<Server#Impresi¢n \<Local#\<Detiene Impresora#Impresi¢n en \<Archivo ASCII'
	=DEFPOP()
	ON SELE POPU grl DO cimp
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Seguridad'
    close data
	=openclos()
	respuesta='grl#10#5#Men£ de Control de Seguridad#3#\<Agrega Usuario#\<Cambia Palabra Clave'
	=DEFPOP()
	ON SELE POPU grl DO cseg
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Imputaci¢n'
	=OPGAS()
	DO grl1 WITH 7,5,'Men£ de Conceptos de Imputaci¢n'
	ON SELE POPU grl DO gas
	ACTI POPU grl
	RELE POPU GRL
ENDCASE
=men_lin(botom)
RETURN
