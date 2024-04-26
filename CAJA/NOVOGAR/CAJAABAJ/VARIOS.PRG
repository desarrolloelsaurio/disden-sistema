***************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 11/18/91
*-- Version :
*-- Notas   : MENU VARIOS
**************************
V_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
DO CASE
case V_DIJO='Bancos'
   do opban
   DO ban
CASE V_DIJO='Ciudades'
	=OPPRV()
	=OPCIU()
   DO grl1 WITH 4,5,'Men£ de Ciudades'
   ON SELE POPU grl DO ciu
   ACTI POPU grl
   RELE POPU grl
CASE V_DIJO='Provincias'
	=OPPRV()
   DO prv
CASE V_DIJO='Tarjetas de Cr‚dito'
   DO optar
   DO grl WITH 7,5,'Men£ de Tarjetas de Cr‚dito'
   ON SELE POPU grl DO tar
   ACTI POPU grl
   RELE POPU grl
CASE V_DIJO='Conceptos de Imputaci¢n'
	=OPGAS()
   DO gas
ENDCASE
=men_lin(botom)
RETURN
