* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ  SISTEMA DE VENTAS - HOGAR : NOVOGAR-ARROYOGAR-TEMACOLOR                 บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 12-08-93                                                    บ
* บ HORA       : 06:30:13pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE IM_LIN
EXTERNAL PROCEDURE FINIMPR
EXTERNAL PROCEDURE SHIT
SET TALK OFF
SET ESCA OFF
CLEA
=bigletT(2,1,'VENTAS')
IF GETENV("EQUIPO")='ARROYO'
   =bigchars(12,1,'ARROYOGAR',6)
ELSE
   IF GETENV("EQUIPO")='EQUIPA'
   =bigchars(12,10,'NOVOGAR',6)

*   =bigchars(11,21,'EQUIPA',6)
*   =bigchars(16,23,'HOGAR',12)   
	ELSE
   =bigchars(12,10,'NOVOGAR',6)
	ENDIF
ENDIF
STORE 0 TO NUL
=MEN_LIN("TECLA PARA CONTINUAR")
=INKEY(0,'HM')
DO WHILE !EMPTY(WONTOP())
   RELE WIND (WONTOP())
ENDDO
DO VENTAS
DO WHILE .T.
   ACTI MENU MAIN
   IF EMPTY(GETENV("EQUIPO")) .OR. ;
   GETENV("EQUIPO")="DESARROLLO" .OR. ;
   GETENV("USERNAME")="GOYO"
      EXIT
   ENDIF
ENDDO
RETURN
PROCEDURE VENTAS
*****************************************************************************
*-- Programa: VENTAS.PRG
*-- Fecha   : 07/01/91 10:55am
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE VENTAS
********************************************************************************
=SETEOS()
ULPR=PROGRAM()
RELE PATH,PATHPRO,PATHVEN,PATHCAJ
PUBL PATH,PATHPRO,PATHVEN,PATHCAJ

=GETPATH()
=GETLIB()
*************************** INICIO COMERCIALIZACION **************************
@ 0,0 SAY REPLICATE("Û",80) COLO W
@ 0,1 SAY PADC('Ventas',20) COLO I
@ 0,23 SAY '|'
@ 0,25 SAY DATE() COLO I
@ 0,34 SAY '|'
@ 0,36 SAY TIME() COLO I
@ 0,45 SAY '|'
@ 0,47 SAY PADC("VENTAS",10) COLO I
@ 0,58 SAY '|'
SET SHAD ON
DO GENVAR
DO GENVAR1
*ESARROYO=(GETENV("EQUIPO")='ARROYO' .OR. GETENV("EQUIPO")='EQUIPA')
ESARROYO=(GETENV("EQUIPO")='ARROYO' .OR. GETENV("EQUIPO")='EQUIPA' .OR. GETENV("EQUIPO")="MICASA")
IF GETENV("EQUIPO")='ARROYO' .OR. ;
   GETENV("EQUIPO")='TEMACOLOR' .OR. ;
   GETENV("EQUIPO")='EQUIPA' 
   RELE COEFSEG,USN,user_no
   PUBL COEFSEG,USN,user_no
   COEFSEG=SEGURIC()
   USADOR=USN
   IF EMPTY(COEFSEG)
      QUIT
   ENDIF
ENDIF
=OPAUD()
=OPSEG()
=OPDOC()
=OPMIX()
XACDIGI=GETNU1(PADR(USADOR,10)+PADR("XACDIGI",20),"FOXPER")
ULPR=PROGRAM()
=IAUD("INGRESO AL SISTEMA")
=CABPAN1()
************************** INICIO COMERCIALIZACION
DEFI MENU MAIN MESSAGE 'MENU PRINCIPAL - SISTEMA DE VENTAS' shad COLO SCHE 2
DEFI PAD varios OF MAIN PROM 'Va\<rios'      AT 01,00 COLO SCHE 2
DEFI PAD provee OF MAIN PROM '\<Proveedores' AT 01,07 COLO SCHE 2
DEFI PAD mercad OF MAIN PROM '\<Mercaderกa'  AT 01,19 COLO SCHE 2
DEFI PAD client OF MAIN PROM '\<Clientes'   AT 01,30 COLO SCHE 2
if ESARROYO
   DEFI PAD ENTRAD OF MAIN PROM '\<Caja' AT 01,39 COLO SCHE 2
   ON sele PAD entrad OF MAIN ACTI popu entrad
   respuesta='entrad#2#39#Entradas de Caja#3;
#\<Cobrado en Efectivo;
#Cobrado con \<Tarjeta;
#Cobrado C\<uota / Cheques;
#Reimprime Re\<cibo;
#-;
#\<Listados;
#-;
#C. C. Clientes por P\<antalla;
#C. C. Clientes por I\<mpresora;
#-;
#\<Reimputa Cobros'
   =defpop()
   ON SELE POPU ENTRAD DO ENTRAD
ELSE
   DEFI PAD remito OF MAIN PROM 'Remit\<o'     AT 01,39 COLO SCHE 2
   ON sele PAD REMITO OF MAIN ACTI popu REMITO
ENDIF
DEFI PAD factur OF MAIN PROM '\<Ventas'     AT 01,46 COLO SCHE 2
DEFI PAD CTACTE OF MAIN PROM 'C\<ta. Cte.'  AT 01,54 COLO SCHE 2
DEFI PAD variab OF MAIN PROM 'V\<ariables'  AT 01,64 COLO SCHE 2
DEFI PAD adios  OF MAIN PROM 'C\<hau'       AT 01,74 COLO SCHE 2

ON SELE PAD VARIOS OF MAIN ACTI POPU VARIOS
ON SELE PAD PROVEE OF MAIN ACTI POPU PROVEE
ON SELE PAD MERCAD OF MAIN ACTI POPU MERCAD
ON SELE PAD CLIENT OF MAIN ACTI POPU CLIENT
ON SELE PAD FACTUR OF MAIN ACTI POPU FACTUR
ON SELE PAD CTACTE OF MAIN ACTI POPU CTACTE
ON SELE PAD VARIAB OF MAIN ACTI POPU VARIAB
ON SELE PAD ADIOS  OF MAIN ACTI POPU ADIOS

respuesta='varios#2#0#A/B/M/L Varios#3;
#\<Alimentaciขn;
#\<Caracterกsticas;
#Ci\<udades;
#C\<olores;
#Co\<ndiciones de Venta;
#Crit\<erios de Agrupaciขn;
#\<Grupos de Compra;
#\<I. V. A.;
#\<Lกneas;
#\<Marcas;
#\<Provincias;
#\<Rubros;
#\<Sub-Rubros;
#\<'+Biajas+';
#\<Tarjetas de Crdito;
#Tipo de \<Documento;
#\<Zonas;
#-;
#Con\<trol de Impresoras'
=defpop()

respuesta='provee#2#7#Gestiขn de Proveedores#3;
#\<Datos Administrativos;
#\<Legajo del Proveedor'
=defpop()

respuesta='mercad#2#19#A/B/M/L Mercaderกas#3#\<Mercaderกas#\<Precios #\<Stock#\<Kardex#\<Consulta Precio'
IF ESARROYO
   RESPUESTA=RESPUESTA+"#\<Lee Precios Casa Central#\<Remitos"
ELSE
   RESPUESTA=RESPUESTA+"#Parti\<da#\<Impuestos Internos#\<Excluye de Lista de Precios#Inclu\<ye en Lista de Precios"
ENDIF
=defpop()

respuesta='client#2#30#Gestiขn de Clientes#3#\<Datos Administrativos#\<Legajo del Cliente;
#-;
#\<Sucursales;
#-;
#\<Garantกas;
#-;
#C\<onsignatarios;
#-;
#\<Services'
=defpop()

respuesta='PEDIDO#2#27#Gestiขn de Notas de Pedido#3;
#\<Recepciขn Nota de Pedido;
#Agrega una \<Nueva Lกnea;
#-;
#Corrige \<Artกculo;
#Corrige \<Lกnea'
RESPUESTA=RESPUESTA+';
#Corrige \<Cabecera;
#-;
#\<Borra Nota de Pedido;
#Borra Lกnea \<Entera;
#-;
#L\<ista por Impresora;
#Lista por \<Pantalla;
#-;
#R\<estaura el Archivo'
=defpop()

respuesta='REMITO#'
IF ESARROYO
   RESPUESTA=RESPUESTA+"7#35"
ELSE
   RESPUESTA=RESPUESTA+"2#39"
ENDIF

RESPUESTA=RESPUESTA+'#Gestiขn de Remitos#3;
#\<Remito a Facturar;
#Remito a \<Sucursales;
#Re\<mito de Reparto;
#-;
#Listado \<por Pantalla;
#Listado por \<Impresora;
#-;
#\<Anula Remito;
#-;
#Trans\<ferencia de Informaciขn;
#-;
#R\<estaura el Archivo'
=DEFPOP()

respuesta='FACTUR#2#46#Gestiขn de Facturaciขn#3;
#Factura \<Directa;
#Factura de Bien de \<Uso;
#Factura de \<Remito;
#-;
#Facturaciขn "\<A";
#Facturaciขn "\<B";
#\<Todas las Facturas'
RESPUESTA=RESPUESTA+;
IIF(ESARROYO,"","#Listado \<Multiempresa")+';
#-;
#A\<nula Factura;
#-;
#\<Reindexa Archivo'
=defpop()

respuesta='ctacte#2#31#Gestiขn de Cuenta Corriente de Clientes#3;
#Notas de \<Dbito;
#Notas de \<Crdito;
#-;
#Estado de Cuenta por \<Pantalla;
#Estado de Cuenta por \<Impresora;
#-;
#\<Reimputa Cobros;
#Gestiขn de \<Saldos de Clientes'+;
IIF(ESARROYO,"#\<Anula Cobros","")+;
'#-;
#Pasa a \<Histขrico;
#Co\<mpacta el Archivo;
#R\<estaura el Archivo;
#Restaura Archivo His\<tขrico'
=DEFPOP()

RESPUESTA='VARIAB#2#50#Mantenimiento de variables del sistema#3;
#\<Popups a Utilizar;
#Ancho de la \<Impresora;
#Ancho de la \<Hoja;
#Largo de la Ho\<ja;
#\<Cantidad de Dกgitos;
#\<Denominaciขn Moneda;
#\<Orden Listados;
#P\<recios por Defecto;
#\<Stocks por Defecto'
RESPUESTA=RESPUESTA+';
#D\<enominaciขn Precios;
#Nง \<Lista de Precios;
#Nง Doc\<umentaciขn;
#Selecciขn \<Mercaderกa;
#Cotizaciขn del Dolar'
=defpop()

respuesta='adios#2#53#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
=DEFPOP()

ON SELE POPU VARIOS DO VARIOS
ON SELE POPU PROVEE DO PRO
ON SELE POPU MERCAD DO MERCAD
ON SELE POPU REMITO DO REMITO
ON SELE POPU CLIENT DO CLIENT
ON SELE POPU FACTUR DO FACTUR
ON SELE POPU CTACTE DO CTACTEC
ON SELE POPU VARIAB DO VARI
ON SELE POPU ADIOS  DO ADIOS

DO WHILE .T.
   ACTI MENU MAIN
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
      EXIT
   ENDIF
ENDDO
RETURN

PROCEDURE GENVAR
* ษออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR.PRG       บ
* บ COMENTARIO    : GENERA VARIABLES บ
* ศออออออออออออออออออออออออออออออออออผ
=VAR_ALI()
=VAR_BAN()
=VAR_CAG()
=VAR_CAR()
=VAR_CIU()
=VAR_CLI()
=VAR_COL()
=VAR_DNI()
=VAR_GAS()
=VAR_GAR()
=VAR_GNT()
=VAR_GRU()
=VAR_IVA()
=VAR_LIN()
=VAR_MAR()
=VAR_MAT()
=VAR_MER()
=VAR_OPK()
=VAR_PAG()
=VAR_PRO()
=VAR_PRV()
=VAR_RUB()
=VAR_SER()
=VAR_SER()
=VAR_SUC()
=VAR_TAR()
=VAR_VIA()
=VAR_VIX()
=VAR_ZON()
PUBL MERPOP,MERPOPC,MERPOPR,MERPOP1
STORE .T. TO MERPOP1
PUBL IPEDR,IPEDC,IPEDAN,IPEDLA
PUBL IREMC,IREMR,IREMAN,IREMLA
PUBL IFACC,IFACR,IFACAN,IFACLA
PUBL SRUPOP,SRUPOPC,SRUPOPR
PUBL MERPOP,MERPOPR,MERPOPC
PUBL MAXCIVA,UNID[30],XACIVA[15,7],XACI[3],XANUM[3,12]
PUBL RUVRO,RUVROS,LLINEA,LLINEAS,JANNAME,COEFSEG,USADOR,XACANCHO,XACHOJA,ACDIGI,XAUS,XAUSS,XACDIGI,KORTE,XANUMCOR
PUBL RH,RP,X10,X15,X20,X30,XADOL,XADOLS,XAMONEDA,XACOTIZ
PUBL XATALMIN,XATALMAX,XATALSTEP,XATALAN,XALIS1,XALIS2,XALIS3,XALIS4
PUBL XAP1,XAP2,XAP3,XAP4,XAS1,XAS2,XAS3,XAS4,XANULIS

=GETPOVEN()
RELEASE     ORDALI,ORDCOL,ORDGRU,ORDLIN,ORDMAR,ORDMER,ORDOPK,ORDPRO,ORDRUB,ORDSRU,ORDZON,ORDCIU,ORDPRV,ORDPAG,ORDCLI,ORDVIA
PUBLIC      ORDALI,ORDCOL,ORDGRU,ORDLIN,ORDMAR,ORDMER,ORDOPK,ORDPRO,ORDRUB,ORDSRU,ORDZON,ORDCIU,ORDPRV,ORDPAG,ORDCLI,ORDVIA
STOR .F. TO ORDALI,ORDCOL,ORDGRU,ORDLIN,ORDMAR,ORDMER,ORDOPK,ORDPRO,ORDRUB,ORDSRU,ORDZON,ORDCIU,ORDPRV,ORDPAG,ORDCLI,ORDVIA

RELE SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,TECMEN,SUCU,ENASCII,PROBE,PROBES,CANT_EMPRE,JANPOP,JANPOPR,JANPOPC,CANT_EMPRE,JANNRO,ESARROYO,TECMOD
PUBL SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,TECMEN,SUCU,ENASCII,PROBE,PROBES,CANT_EMPRE,JANPOP,JANPOPR,JANPOPC,CANT_EMPRE,JANNRO,ESARROYO,TECMOD

RELE SSTM1,TEX_EFES,ABA,SSTM2
PUBL SSTM1,TEX_EFES,ABA,SSTM2

RELE IVA09,IVA109,PC9,IVA18,IVA118,PC18,PC27,IVA127
PUBL IVA09,IVA109,PC9,IVA18,IVA118,PC18,PC27,IVA127

IVA09=10.5/100
IVA109=1+IVA09
PC9="10.50 %"
IVA18=21/100
IVA118=1+IVA18
PC18="21.00 %"
PC27="31.50 %"
IVA127=1.315

SSTM2="VENTAS"

CANT_EMPRE=1
ABA="Abriendo Base de "
JANNRO=1
probe="Proveedor"
probes="Proveedores"
TECMOD='[TECLA] Y [ENTER] Para Modificar'

PAIP='|'
BOTOM="  "+REPL("ฐ",78)
TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
SSTM=padc('Ventas',19)
SSTM1="HOGAR"
STORE 0 TO NUL
=GETJANNA()
ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
TEN='Existe - [ENTER] para Continuar'
TECMEN="[ENTER] para Menฃ"
nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
offnlq=chr(27)+chr(120)+chr(0)+chr(18)+chr(27)+chr(113)+chr(0)
UNDER=CHR(27)+CHR(45)+CHR(1)
OFFUNDER=CHR(27)+CHR(45)+CHR(0)
WIDE=CHR(27)+CHR(87)+CHR(1)
OFFWIDE=CHR(27)+CHR(87)+CHR(0)
RETURN

PROCEDURE GENVAR1
* ษออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR1.PRG      บ
* บ COMENTARIO    : GENERA VARIABLES บ
* ศออออออออออออออออออออออออออออออออออผ
STORE 36 TO RH
STORE 47 TO RP
STORE REPL("!",10) TO X10
STORE REPL("!",15) TO X15
STORE X10+X10 TO X20
STORE X15+X15 TO X30
=GETGENE()
COEFSEG=1
USADOR=GETENV("USERNAME")
RELE PDS
PUBL PDS[2]
PDS[1]=132
PDS[2]=233
GENPED=.F.
GENREM=.F.
BIAJA='Vendedor'
BIAJAS='Vendedores'
RETURN
**************