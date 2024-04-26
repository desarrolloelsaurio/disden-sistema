********************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************
=CABPAN1()
V_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE V_DIJO='Bancos'
respuesta='BANCOS#4#20#A/B/M/L Bancos#3;
#\<Bancos;
#\<N§ de Cheque'
=defpop()
ON SELE POPU BANCOS DO BANC
ACTI POPU BANCOS
RELE POPU BANCOS
CASE V_DIJO='Provincias'
   =PRV()
CASE V_DIJO='Zonas'
   =ZON()
CASE V_DIJO='Criterios de Agrupaci¢n'
   =CAG()
CASE V_DIJO="Alimentaci¢n"
   =ALI()
CASE V_DIJO="Caracter¡sticas"
   =CAR()
CASE V_DIJO="Ciudades"
	=OPPRV()
	=OPCIU()
   DO GRL WITH 4,5,'Men£ de Ciudades'
   ON SELE POPU grl DO ciu
   ACTI POPU grl
   RELE POPU grl
CASE V_DIJO="Colores"
   DO COL.PRG
CASE V_DIJO="Condiciones de Venta" .or. V_DIJO="Condiciones de Pago"
   =PAG()
CASE V_DIJO="Grupos de Compra"
   =GRU()
CASE V_DIJO="I. V. A."
   =IVA()
CASE V_DIJO="L¡neas"
=LIN()
CASE V_DIJO="Marcas"
=MAR()
CASE V_DIJO="Rubros"
	=OPRUB()
   DO RUB.SPR
CASE V_DIJO="Sub-Rubros"
	=OPRUB()
   DO opsru
   DO grl WITH 7,5,'Men£ de Sub-Rubros'
   ON SELE POPU grl DO sru
   ACTI POPU grl
   RELE POPU grl
 CASE V_DIJO=Biajas
	=OPCIU()
	=OPVIA()
   DO grl WITH 7,5,'Men£ de '+biajas
   ON SELE POPU grl DO via
   ACTI POPU grl
   RELE POPU grl
 CASE V_DIJO="Tarjetas de Cr‚dito"
=tar()
 CASE V_DIJO="Tipo de Documento"
=DNI()
 CASE V_DIJO="Conceptos de Imputaci¢n"
	=OPGAS()
   DO gas
CASE V_DIJO="Control de Impresoras"
   =OPCIMP()
ENDCASE
RETURN MEN_LIN(BOTOM)
