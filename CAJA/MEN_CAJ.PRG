* ฺฤ Program ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
* ณ  Application: MENU DE CAJA       ณ 
* ณ    File Name: MEN_CAJ.PRG        ณ 
* ณ       Author: G. REINER          ณ 
* ณ Date created: 05-04-94           ณ 
* ณ Time created: 02:37:48pm         ณ 
* ณ    Copyright: 1994 by G. REINER  ณ 
* ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู
FUNCTION MEN_CAJ
ACTI WIND THERMO
SET SHAD ON
=GENVAR()
=TER_SMO1(2)
=GENVAR1()
=TER_SMO1(2)
ACTI SCRE
=OPAUD()
ACTI WIND THERMO
=TER_SMO1(2)
ACTI SCRE
=OPSEG()
ACTI WIND THERMO
=TER_SMO1(2)
ACTI SCRE
=OPDOC()
=OPMIX()
ACTI WIND THERMO
=TER_SMO1(2)
ULPR=PROGRAM()
ACTI SCRE
=CABPAN1()
ACTI WIND THERMO
=TER_SMO1(2)
************************** INICIO CAJA
DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE CAJA' shad
=TER_SMO1(2)
DEFI PAD VARIOS OF MAIN PROM '\<Varios'    AT 01,00 colo sche 2
DEFI PAD CLIENT OF MAIN PROM '\<Clientes' AT 01,07 colo sche 2
=TER_SMO1(2)
DEFI PAD PROVEE OF MAIN PROM '\<Proveedores' AT 01,16 colo sche 2
DEFI PAD SALIDA OF MAIN PROM '\<Salidas '    AT 01,28 colo sche 2
=TER_SMO1(2)
DEFI PAD ENTRAD OF MAIN PROM '\<Entradas'    AT 01,37 colo sche 2
DEFI PAD CTACTE OF MAIN PROM 'C\<tas Ctes' AT 01,46 colo sche 2
=TER_SMO1(2)
DEFI PAD BANCOS OF MAIN PROM '\<Bancos '      AT 01,56 colo sche 2
DEFI PAD VARIAB OF MAIN PROM 'V\<ariables '   AT 01,63 colo sche 2
=TER_SMO1(2)
DEFI PAD ADIOS  OF MAIN PROM 'C\<hau'      AT 01,74 colo sche 2
=TER_SMO1(2)
ON SELE PAD varios OF main ACTI POPUP varios
=TER_SMO1(2)
ON SELE PAD client OF main ACTI POPUP client
=TER_SMO1(2)
ON SELE PAD provee OF main ACTI POPUP provee
ON SELE PAD salida OF main ACTI POPUP salida
=TER_SMO1(2)
ON SELE PAD entrad OF main ACTI POPUP entrad
=TER_SMO1(2)
ON SELE PAD ctacte OF main ACTI POPUP ctacte
ON SELE PAD bancos OF main ACTI POPUP bancos
=TER_SMO1(2)
ON SELE PAD variab OF main ACTI POPUP variab
=TER_SMO1(2)
ON SELE PAD adios  OF main ACTI POPUP adios
=TER_SMO1(2)

respuesta='varios#2#0#A/B/M/L Varios#3;
#\<Bancos;
#\<Ciudades;
#C\<onceptos de Imputaciขn;
#Co\<ndiciones de Pago;
#\<I. V. A.;
#\<Provincias;
#\<Tarjetas de Crdito;
#Tipo de \<Documento'
RESPUESTA=RESPUESTA+';
#-;
#Control de I\<mpresoras'
=TER_SMO1(2)
=DEFPOP()
=TER_SMO1(2)

respuesta='client#2#7#Gestiขn de Clientes#3#\<Datos Administrativos#\<Legajo del Cliente'
IF SSTM1="HOGAR"
   RESPUESTA=RESPUESTA+'#-;
#\<Garantกas;
#Legajo de la Garan\<tกa;
#-;
#C\<onsignatarios;
#Legajo del Consi\<gnatario'
ENDIF
=DEFPOP()
=TER_SMO1(2)

respuesta='provee#2#16#Gestiขn de Proveedores#3#\<Datos Administrativos#\<Legajo del Proveedor'
=DEFPOP()
=TER_SMO1(2)
respuesta='salida#2#28#Salidas de Caja#3;
#Pa\<go a Proveedores;
#Pago a C\<uenta;
#-;
#Salida de \<Efectivo;
#Salida de \<Cheques Propios;
#Salida de Cheques de \<Terceros;
#-;
#Egresos por \<Pantalla;
#Egresos por \<Impresora'
*#C. C. Proveed. por P\<antalla#C. C. Proveed. por I\<mpresora#-#Reimp\<uta pagos#\<Salda Cta Cte'
=DEFPOP()
=TER_SMO1(2)

respuesta='entrad#2#37#Entradas de Caja#3;
#\<Cobrado en Efectivo;
#Cobrado con \<Tarjeta;
#Cobrado C\<uota - Cheques;
#-;
#Ingreso de \<Efectivo;
#Ingreso de \<Valores Diferidos;
#-;
#\<Listados;
#-;
#Reinde\<xa'
=DEFPOP()
=TER_SMO1(2)

respuesta='ctacte#2#46#Gestiขn de Cuentas Corrientes#3;
#Cuenta Corriente \<Clientes;
#Cuenta Corriente \<Proveedores'
=DEFPOP()
=TER_SMO1(2)

respuesta='bancos#2#37#Sistema de Bancos#3;
#\<Transferencia de Fondos;
#\<Acreditaciขn de Cheques;
#-;
#A\<juste de Cta Cte;
#\<Depขsito en Efectivo;
#Depขsito de \<Cheques de Terceros;
#-;
#Listados por \<Pantalla;
#Listados por \<Impresora'
=DEFPOP()
=TER_SMO1(2)

respuesta='variab#2#50#Mantenimiento de Variables del sistema#3#\<Popups a Utilizar#Ancho de la \<Impresora#Ancho de la \<Hoja#'
respuesta=respuesta+'\<Cantidad de Dกgitos#\<Denominaciขn Moneda#Nง Doc\<umentaciขn#\<Orden de los Listados'
=TER_SMO1(2)
=DEFPOP()
=TER_SMO1(2)

respuesta='adios#2#53#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
=DEFPOP()

ON SELE POPUP VARIOS DO VARIOS
ON SELE POPUP CLIENT DO CLIENT
=TER_SMO1(2)
ON SELE POPUP PROVEE DO PROVEE
ON SELE POPUP SALIDA DO SALIDA
=TER_SMO1(2)
ON SELE POPUP ENTRAD DO ENTRAD
ON SELE POPUP CTACTE DO CTACTE
ON SELE POPUP BANCOS DO BANCOS
=TER_SMO1(2)
ON SELE POPUP VARIAB DO VARI
ON SELE POPUP ADIOS  DO ADIOS
RELE CNTR,COUNT,LAST_NUM,SEGU,C
RETURN RELEWIN("THERMO")
