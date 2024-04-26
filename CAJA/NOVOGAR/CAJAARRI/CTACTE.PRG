*********************************************************************************
*-- Programa: CTACTE.PRG
*-- Fecha   : 01-26-93 05:51pm
*-- Version : G. REINER
*-- Notas   : DERIVA A MENUES DE CUENTA CORRIENTE (CLIENTES Y PROVEEDORES)
*-- VERSION CAJA ARRIBA NOVOGAR
********************************************************************************
=CABPAN1()
DO CASE
case BAR()=1
respuesta='ctacteX#4#40#Gesti¢n de Cuenta Corriente de Clientes#3;
#Notas de \<D‚bito;
#Notas de \<Cr‚dito;
#-;
#Estado de Cuenta por \<Pantalla;
#Estado de Cuenta por \<Impresora'

RESPUESTA=RESPUESTA+';
#-;
#\<Anula Cobros;
#R\<eimputa Cobros;
#Gesti¢n de \<Saldos de Clientes'
RESPUESTA=RESPUESTA+';
#-;
#C\<ompacta el Archivo;
#\<Restaura el Archivo'
	=DEFPOP()
	ON SELE POPU CTACTEX DO CTACTEC WITH 6,35
	ACTI POPU CTACTEX
	RELE POPU CTACTEX
CASE BAR()=2
	respuesta='ctactex#4#40#Cuenta Corriente del Proveedor#3#\<Estado de Cuenta por Pantalla#Estado de Cuenta por \<Impresora#-#Notas de D‚bito#Notas de Cr‚dito'
	=DEFPOP()
	ON SELE POPU CTACTEX DO CTACTEp
	ACTI POPU CTACTEX
	RELE POPU CTACTEX
ENDCASE
RETURN men_lin(botom)
