*********************************************************************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 11/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : MENU VARIOS
********************************************************************************
=CABPAN1()
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
   DO acciva
CASE BAR()=4
	=OPPRV()
   DO grl WITH 7,5,'Men£ de Provincias'
   ON SELE POPU grl DO prv
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=5
	=OPGAS()
   DO grl WITH 7,5,'Men£ de Tipo de Gasto'
   ON SELE POPU grl DO gas
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=6
   DO oppag
   DO grl WITH 7,5,'Men£ de Condiciones de Pago'
   ON SELE POPU grl DO pag
   ACTI POPU grl
   RELE POPU grl
ENDCASE
RETURN MEN_LIN(BOTOM)
