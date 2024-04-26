*******************************
*-- Programa: client.prg
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*******************************
PARAMETER COLUCLI
PRIVATE COLUCLI
DIJO=ALLTRIM(PROMPT())
M.COLUCLI=IIF(EMPTY(PARAMETER()),20,M.COLUCLI)
ulpr=HORA_ULP(PROGRAM())
=cabpan1()
DO CASE
CASE DIJO='Datos Administrativos'
   DO cli
CASE DIJO='Legajo del Cliente'
   DO cli
case bar()=3
	=OPPRV()
	=OPFAC()
	=OPCLI()
   respuesta='ctacte#2#31#Gesti¢n de Cuenta Corriente de Clientes#3#Notas de \<D‚bito#Notas de \<Cr‚dito#-#Estado de Cuenta por \<Pantalla#Estado de Cuenta por \<Impresora#-#\<Restaura el Archivo'
	=DEFPOP()
   ON SELE POPU CTACTE DO ctactec
   ACTI POPU CTACTE
   RELE POPU CTACTE
CASE DIJO='Garant¡as'
	=OPPRV()
	=OPCLI()
   DO OPGAR
   DO PER.SPR WITH "Garant¡a"
CASE DIJO='Sucursales'
	=OPPRV()
	=OPCLI()
    =suc()
CASE DIJO='Consignatarios'
=OPPRV()
=OPCLI()
DO OPGNT
*DO GNT.SPR
CASE DIJO='Services'
   respuesta='SERVIS#7#46#Gesti¢n de Services#3;
#\<Datos Administrativos;
#\<Legajo;
#\<Marcas'
=DEFPOP()
   ON SELE POPU servis DO ser
   ACTI POPU servis
   RELE POPU servis
   ulpr=hora_ulp()
ENDCASE
RETURN men_lin(botom)
