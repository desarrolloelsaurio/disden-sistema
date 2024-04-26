*********************************************************************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
=cabpan1()
dijo=alltrim(prompt())
DO CASE
CASE DIJO='Pa¡ses'
	DO oppai
	DO GRL WITH 5,5,'Men£ de Pa¡ses'
	ON SELE POPU grl DO pai
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Colores'
	DO opcol
	DO GRL WITH 5,5,'Men£ de Colores'
	ON SELE POPU grl DO COL
	ACTI POPU grl
	RELE POPU grl
CASE dijo='Materiales'
	DO opmat
	DO grl1 WITH 4,5,'Men£ de Materiales'
	ON SELE POPU grl DO mat
	ACTI POPU grl
	RELE POPU grl
CASE dijo='L¡neas'
	DO oplin
	DO grl1 WITH 4,5,'Men£ de L¡neas'
	ON SELE POPU grl DO lin
	ACTI POPU grl
	RELE POPU grl
CASE dijo='Ciudades'
	=OPCIU()
	DO grl1 WITH 4,5,'Men£ de Ciudades'
	ON SELE POPU grl DO ciu
	ACTI POPU grl
	RELE POPU grl
CASE dijo='I. V. A.'
	DO acciva
CASE dijo='Marcas'
	=OPMAR()
	DO grl1 WITH 7,5,'Men£ de Marcas'
	ON SELE POPU grl DO mar
	ACTI POPU grl
	RELE POPU grl
CASE dijo='Provincias'
	=OPPRV()
	DO grl1 WITH 7,5,'Men£ de Provincias'
	ON SELE POPU grl DO prv
	ACTI POPU grl
	RELE POPU grl
CASE dijo='Rubros'
	=OPRUB()
	DO grl1 WITH 7,5,'Men£ de Rubros'
	ON SELE POPU grl DO rub
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Sub-Rubros'
	=OPRUB()
	DO opsru
	DO grl WITH 7,5,'Men£ de Sub-Rubros'
	ON SELE POPU grl DO sru
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Grupos de Compra'
	DO opGRU
	DO grl1 WITH 7,5,'Men£ de Grupos de Compra'
	ON SELE POPU grl DO gru
	ACTI POPU grl
	RELE POPU grl
CASE DIJO='Conceptos de Agrupaci¢n'
	DO opCAG
	DO grl1 WITH 7,5,'Men£ de Conceptos de Agrupaci¢n'
	ON SELE POPU grl DO CAG
	ACTI POPU grl
	RELE POPU GRL
CASE DIJO='Cambio Contrase¤a'
	CLOSE DATA
	do ch_pass with "c:\public\monday.pas"
	=OPENCLOS()
ENDCASE
=men_lin(botom)
RETURN
