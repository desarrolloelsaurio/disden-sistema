*********************************************************************************
*-- Programa: client.prg
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
PARAMETER COLUCLI
PRIVATE COLUCLI
M.COLUCLI=IIF(EMPTY(PARAMETER()),20,M.COLUCLI)
ulpr=HORA_ULP(PROGRAM())
=cabpan1()
DO CASE
CASE BAR()=1
	=OPCIU()
   DO OPZON
	=OPCLI()
   DO grl3 WITH 4,COLUCLI+5,'Men£ Administrativo de Clientes'
   ON SELE POPU grl DO cli
   ACTI POPU grl
   RELE POPU grl
CASE BAR()=2
	=OPPRV()
	=OPCIU()
	=OPCLI()
   respuesta='grl#4#'+STR(COLUCLI+5)+'#Legajo de Clientes#3#\<Ingresa / Modifica#-#\<Borra un Legajo#Borra \<Todos los Legajos#-#Lista \<por Pantalla#\<Lista por Impresora'
	=DEFPOP()
   ON SELE POPU grl DO clij
   ACTI POPU grl
   RELE POPU grl
case bar()=3
   #IF !("NOVOGAR" $ CURDIR())
		=OPPRV()
		=OPCIU()
		=OPFAC()
		=OPCLI()
      respuesta='ctacte#2#31#Gesti¢n de Cuenta Corriente de Clientes#3#Notas de \<D‚bito#Notas de \<Cr‚dito#-#Estado de Cuenta por \<Pantalla#Estado de Cuenta por \<Impresora#-#\<Restaura el Archivo'
		=DEFPOP()
      ON SELE POPU CTACTE DO ctactec
      ACTI POPU CTACTE
      RELE POPU CTACTE
   #ENDIF
ENDCASE
RETURN men_lin(botom)
