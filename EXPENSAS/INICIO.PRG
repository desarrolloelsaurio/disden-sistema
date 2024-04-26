* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    : INICIO SISTEMA DE CONSORCIOS - ORIGEN RAFULS             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-27-93                                                    บ
* บ HORA       : 01:00:47am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE SHIT
EXTERNAL PROCEDURE NADA
SET TALK OFF
SET ESCA OFF
CLEA
=BIGCHARS(2,10,'EXPENSAS')
=BIGCHARS(12,18,'RAFULS',11)
ANTWIN=WONTOP()
ACTI SCRE
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
=INKEY(0,"HM")
ACTI WIND (ANTWIN)
DO WHILE !EMPTY(WONTOP())
RELE WIND (WONTOP())
ENDDO
STORE .T. TO CONTROL
DO CONSORCI
DO WHILE .T.
   ACTI MENU MAIN
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
      EXIT
   ENDIF
ENDDO
RETURN
PROCEDURE CONSORCI
*********************************************************************************
*-- Programa: CONSORCIOS.PRG
*-- Fecha   : 07/01/91 10:55am
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE CONSORCIOS
********************************************************************************
=GETFUSER()
=SETEOS()
ULPR=PROGRAM()
CLEA
SET COLO TO W+
@ 0,0,24,79 BOX REPL("ฐ",9)
CNTR=0
COUNT=100
LAST_NUM=0
C=3
=ter_smoo(' Sistema de Expensas ','Construyendo Menฃes','Espere por Favor')
SET COLO TO
RELE PATH,PATHPRO,PATHVEN,PATHCNS,PATHALQ,PATHCOM
PUBL PATH,PATHPRO,PATHVEN,PATHCNS,PATHALQ,PATHCOM
=GETPATH("PATHCNS")
*************************** INICIO expensas ***********************************
=TER_SMO1(3)
ACTI SCRE
@ 0,0 SAY REPLICATE("Û",80) COLO W
@ 0,1 SAY PADC('EXPENSAS',20) COLO I
@ 0,23 SAY '|'
@ 0,25 SAY DATE() COLO I
@ 0,34 SAY '|'
@ 0,45 SAY '|'
@ 0,58 SAY '|'
ACTI WIND THERMO
SET SHAD ON
=GENVAR()
=TER_SMO1(3)
=GENVAR1()
=TER_SMO1(3)
ACTI SCRE
=OPAUD()
ACTI WIND THERMO
=TER_SMO1(3)
ACTI SCRE
=OPSEG()
ACTI WIND THERMO
=TER_SMO1(3)
ACTI SCRE
=OPDOC(24)
=OPMIX()
ACTI WIND THERMO
=TER_SMO1(3)
ULPR=PROGRAM()
ACTI SCRE
=CABPAN1()
ACTI WIND THERMO
=TER_SMO1(3)
************************** INICIO CONSORCIOS
DEFI MENU MAIN MESSAGE 'MENU PRINCIPAL - SISTEMA DE EXPENSAS' SHAD COLO SCHE 2
=TER_SMO1(3)
DEFI PAD VARIOS OF MAIN PROM '\<Varios'      AT 01,00 COLO SCHE 2
DEFI PAD CLIENT OF MAIN PROM '\<Clientes'    AT 01,07 COLO SCHE 2
=TER_SMO1(3)
DEFI PAD CONSOR OF MAIN PROM 'C\<onsorcios'  AT 01,16 COLO SCHE 2
DEFI PAD PROVEE OF MAIN PROM '\<Proveedores' AT 01,27 COLO SCHE 2
=TER_SMO1(3)
DEFI PAD LIQUID OF MAIN PROM '\<Liquidaciขn' AT 01,40 COLO SCHE 2
DEFI PAD CTACTE OF MAIN PROM 'C\<tas. Ctes.' AT 01,52 COLO SCHE 2
=TER_SMO1(3)
DEFI PAD VARIAB OF MAIN PROM 'V\<ariables'   AT 01,64 COLO SCHE 2
DEFI PAD ADIOS  OF MAIN PROM 'C\<hau'        AT 01,74 COLO SCHE 2
=TER_SMO1(3)
ON SELE PAD VARIOS OF MAIN ACTI POPU VARIOS
ON SELE PAD CONSOR OF MAIN ACTI POPU CONSOR
=TER_SMO1(3)
ON SELE PAD CLIENT OF MAIN ACTI POPU CLIENT
=TER_SMO1(3)
ON SELE PAD PROVEE OF MAIN ACTI POPU PROVEE
ON SELE PAD LIQUID OF MAIN ACTI POPU LIQUID
ON SELE PAD CTACTE OF MAIN ACTI POPU CTACTE
=TER_SMO1(3)
ON SELE PAD VARIAB OF MAIN ACTI POPU VARIAB
ON SELE PAD ADIOS  OF MAIN ACTI POPU ADIOS
=TER_SMO1(3)

respuesta='varios#2#0#A/B/M/L Varios#3;
#\<Ciudades;
#\<I. V. A.;
#\<Provincias;
#Condiciones de \<Pago;
#-;
#Control I\<mpresoras;
#-;
#Mensa\<jes'
=ter_smo1(3)
=defpop()

respuesta='client#2#7#Gestiขn de Consorcistas#3;
#\<Datos Administrativos;
#\<Legajo'
=defpop()
=ter_smo1(6)

respuesta='consor#2#16#A/B/M/L Consorcios#3;
#\<Tipo de Unidad;
#\<Consorcios;
#\<Unidades de Consorcios;
#-;
#Tipo de \<Gastos;
#G\<astos de Unidades'
=ter_smo1(3)
=defpop()

=ter_smo1(3)
respuesta='provee#2#27#Gestiขn de Proveedores - Facturas de Servicios#3;
#\<Datos Administrativos;
#\<Legajo del Proveedor;
#-;
#\<Facturas de Servicio'
=ter_smo1(6)
=defpop()

respuesta='liquid#2#40#Registro de Expensas#3;
#\<Prepara Liquidaciขn;
#\<Modifica;
#\<Genera Liquidaciขn;
#Genera C\<abecera;
#-#Visualiza Importe por \<Unidad;
#\<Visualiza Cabecera;
#I\<mprime Cabecera;
#\<Imprime Liquidaciขn'
=defpop()
=ter_smo1(3)

respuesta='ctacte#2#31#Cuenta Corriente de Consorcistas#3;
#\<Genera Deuda;
#-;
#Estado de Cuenta por \<Pantalla;
#Estado de Cuenta por \<Impresora'
=defpop()

=ter_smo1(3)
respuesta='variab#2#50#Mantenimiento de Variables del Sistema#3;
#\<Popups a Utilizar;
#Ancho de la \<Impresora;
#Ancho de la \<Hoja;
#\<Cantidad de Dกgitos;
#\<Denominaciขn Moneda;
#\<Orden Listados#'
respuesta=respuesta+'Nง Doc\<umentaciขn#Coti\<zaciขn '+xadol
=ter_smo1(3)
=defpop()
=ter_smo1(3)
respuesta='adios#2#53#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
=TER_SMO1(3)
=DEFPOP()
=TER_SMO1(3)

ON SELE POPU VARIOS DO VARIOS
ON SELE POPU CONSOR DO CONSOR
ON SELE POPU CLIENT DO CSS
=TER_SMO1(3)
ON SELE POPU PROVEE DO PRO
=TER_SMO1(3)
ON SELE POPU LIQUID DO LIQUID
ON SELE POPU VARIAB DO VARI
ON SELE POPU CTACTE DO CTACTE
ON SELE POPU ADIOS DO ADIOS
=TER_SMO1(3)
RELE CNTR,COUNT,LAST_NUM,SEGU,C
=RELEWIN("THERMO")
DO WHILE .T.
   ACTI MENU MAIN
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
      EXIT
   ENDIF
ENDDO
RETURN
PROCEDURE GENVAR
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR.PRG                                               บ
* บ COMENTARIO    : GENERA GARIABLES DEL SISTEMA                             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-27-93                                                    บ
* บ HORA       : 01:00:47am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
=VAR_BAN()
=TER_SMO1(1)
=VAR_CIU()
=TER_SMO1(1)
=VAR_CNS()
=TER_SMO1(1)
=VAR_CNX()
=TER_SMO1(1)
=VAR_CON()
=TER_SMO1(1)
=VAR_CSS()
=TER_SMO1(1)
=VAR_GAS()
=TER_SMO1(1)
=VAR_IVA()
=TER_SMO1(1)
=VAR_PRO()
=TER_SMO1(1)
=VAR_PRV()
=TER_SMO1(1)
=VAR_TIP()
=TER_SMO1(1)
=VAR_TIX()
=TER_SMO1(1)
=VAR_INQ()
=TER_SMO1(1)
=VAR_TAR()
=TER_SMO1(1)
=VAR_PAG()
=TER_SMO1(1)
PUBL MAXCIVA,UNID[30],XACIVA[15,7],XACI[3],XANUM[3,12]
PUBL RUVRO,RUVROS,JANNAME,COEFSEG,USADOR,XACANCHO,XACHOJA,ACDIGI,XAUS,XAUSS,XACDIGI,KORTE,XANUMCOR
PUBL BIAJA,BIAJAS
PUBL RH,RP,X10,X15,X20,X30,ORDCLI,ORDMER,ORDPRO,XADOL,XADOLS,XAMONEDA,XACOTIZ
PUBL XATALMIN,XATALMAX,XATALSTEP,XATALAN,XALIS1,XALIS2,XALIS3,XALIS4
PUBL XAP1,XAP2,XAP3,XAP4,XAS1,XAS2,XAS3,XAS4,XANULIS

=GETPOCSN()

RELE SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMOD,SUCU,NUMIM,CART_INQUI,CART_PROPI,PROBE,PROBES,CANT_EMPRE,SSTM1,ABA
PUBL SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMOD,SUCU,NUMIM,CART_INQUI,CART_PROPI,PROBE,PROBES,CANT_EMPRE,SSTM1,ABA

RELE TEX_EFES,JANNRO,SSTM2,ENASCII
PUBL TEX_EFES,JANNRO,SSTM2,ENASCII

TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
ABA="Abriendo Base de "

store 1 to cant_empre,JANNRO
probe="Proveedor"
probes="Proveedores"

sucu='0001'
TECMOD="TECLA y [ENTER] modifica"
botom='  '+repl('ฐ',78)
PAIP='|'
STOR 0 TO NUL,numim
SSTM=padc('Expensas',19)
SSTM1="ADMIN"
SSTM2="EXPENSAS"
ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
TEN='Existe - [ENTER] para Continuar'
nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
offnlq=chr(27)+chr(120)+chr(0)+chr(18)
UNDER=CHR(27)+CHR(45)+CHR(1)
OFFUNDER=CHR(27)+CHR(45)+CHR(0)
IF EMPTY(GETENV("IMPRE"))
   WIDE=CHR(27)+CHR(87)+CHR(1)
   OFFWIDE=CHR(27)+CHR(87)+CHR(0)
   UNDER=CHR(27)+CHR(45)+CHR(1)
   OFFUNDER=CHR(27)+CHR(45)+CHR(0)
ELSE
   WIDE=CHR(27)+CHR(33)+CHR(32)
   OFFWIDE=CHR(27)+CHR(33)+CHR(0)
   UNDER=CHR(27)+CHR(33)+CHR(128)
   OFFUNDER=CHR(27)+CHR(33)+CHR(0)
ENDIF
RETURN
PROCEDURE GENVAR1
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR1.PRG                                              บ
* บ COMENTARIO    : GENERA GARIABLES DEL SISTEMA                             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-27-93                                                    บ
* บ HORA       : 01:00:47am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE 36 TO rh
STORE 47 TO rp
STORE REPL("!",10) TO x10
STORE REPL("!",15) TO x15
STORE REPL("!",20) TO x20
STORE REPL("!",30) TO x30
DO CASE
CASE EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
   REST FROM (PATH+'\GENE') ADDI
CASE GETENV("EQUIPO")="MICASA" .OR. ;
GETENV("EQUIPO")="GOYOLAP"
   REST FROM GENE ADDI
OTHERWISE
   REST FROM (PATHCOM+'\GENE') ADDI
ENDCASE
=GETPATH("PATHCNS")
STORE 'ADMINISTRACION RAFULS' TO janname
store "Viajante" to biaja
store "Viajantes" to biajas
COEFSEG=1
USADOR=GETENV("USERNAME")
RELE PDS
PUBL PDS[2]
PDS[1]=132
PDS[2]=233
GENPED=.F.
GENREM=.F.
*** RECUPERA VARIABLES 
=OPMIX()
XACDIGI=GETNU1(PADR(USADOR,10)+PADR("XACDIGI",20),"FOXPER")
XACANCHO=GETNU1(PADR(USADOR,10)+PADR("XACANCHO",20),"FOXPER")
XACHOJA=GETNU1(PADR(USADOR,10)+PADR("XACHOJA",20),"FOXPER")
RETURN
