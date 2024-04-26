*ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
*บ PROCEDIMIENTO : INICIO.PRG                                             บ
*บ COMENTARIO    : INICIO SISTEMA DE CAJA PUBLICO (RAFULS)                บ
*ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
*บ AUTOR      : GOYO REINER                                               บ
*บ FECHA      : 08-22-93                                                  บ
*บ HORA       : 05:01:18pm                                                บ
*บ COPYRIGHT  : 1993 by GREGORIO REINER                                   บ
*ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE NADA.PRG
EXTERNAL PROCEDURE SHIT.PRG
SET TALK OFF
SET ESCA OFF
CLEA
=BIGCHARS(2,25,'CAJA')
=BIGCHARS(15,17,'RAFULS',5)
ANTWIN=WONTOP()
ACTI SCRE
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
=INKEY(0,"HM")
ACTI WIND (ANTWIN)
DO WHILE !EMPTY(WONTOP())
   RELE WIND (WONTOP())
ENDDO
STORE .T. TO CONTROL
#define PAIP "|" && PAIP
=GETFUSER()
=SETEOS()
ULPR=PROGRAM()
=BOX()
CNTR=0
COUNT=100
LAST_NUM=0
C=3
=TER_SMOO(' Sistema de Caja Pฃblico ','Construyendo Menฃes','Espere por Favor')
RELE PATH,PATHCAJ,PATHPRO,PATHVEN,PATHCOM,PATHCPR,PATHALQ,PATHCNS
PUBL PATH,PATHCAJ,PATHPRO,PATHVEN,PATHCOM,PATHCPR,PATHALQ,PATHCNS
=GETPACAA()
*************************** INICIO CAJA **************************
=TER_SMO1(3)
ACTI SCRE
@ 0,0 SAY REPLICATE("Û",80) COLO W
@ 0,1 SAY PADC('Caja',20) COLOR I
@ 0,23 SAY PAIP
@ 0,25 SAY DATE() COLOR I
@ 0,34 SAY PAIP
@ 0,36 SAY TIME() COLOR I
@ 0,45 SAY PAIP
@ 0,47 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY PAIP
ACTI WIND THERMO
SET SHAD ON
*
PUBL JANPOP,JANPOPR, JANPOPC
=VAR_BAN()
=VAR_CNS()
=VAR_CSS()
=VAR_INQ()
=VAR_INM()
STORE .T. TO INQPOP,INMPOP
=VAR_PRP()
STORE .T. TO PRPPOP
=VAR_CIU()
=VAR_CLI()
STORE .T. TO CLIPOP
=VAR_GAS()
STORE .T. TO GASPOP
=VAR_GAR()
=VAR_PRV()
=VAR_INM()
=VAR_PAG()
=VAR_PRO()
PUBL IPEDR,IPEDC,IPEDAN,IPEDLA
=VAR_TAR()
=VAR_MAR()
PUBL JANPOP,JANPOPR,JANPOPC
PUBL MERPOP,MERPOPR,MERPOPC
PUBL MAXCIVA,UNID[30],XACIVA[15,7],XACI[3],XANUM[3,12]
PUBL ABIO,ABIOS,TELLA,TELLAS,ZUELA,ZUELAS,RUVRO,RUVROS,LLINEA,LLINEAS,JANNAME,COEFSEG,USADOR,XACANCHO,XACHOJA,ACDIGI,XAUS,XAUSS,XACDIGI,KORTE,XANUMCOR
PUBL MADER,MADERS,GENPED,GENREM
PUBL RH,RP,X10,X15,X20,X30,ORDPRO,XADOL,XADOLS,XAMONEDA,XACOTIZ
PUBL XATALMIN,XATALMAX,XATALSTEP,XATALAN,XALIS1,XALIS2,XALIS3,XALIS4
PUBL XAP1,XAP2,XAP3,XAP4,XAS1,XAS2,XAS3,XAS4,XANULIS,BIAJA,BIAJAS
PUBL JANNRO, JANNAME

DO CASE
CASE EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
   REST FROM (PATH+'\POSIC') ADDI
CASE GETENV("EQUIPO")="MICASA" .OR. ;
     GETENV("EQUIPO")="NOVOLAP" .OR. ;
     GETENV("EQUIPO")="GOYOLAP"
   REST FROM POSIC ADDI
OTHERWISE
   REST FROM ('F:\USR\'+GETENV("USERNAME")+"\POSICCAJ") ADDI
ENDCASE

#undefine PAIP

RELE ORDCIU,ORDCLI,ORDMAR,ORDPRV,ORDPRO,ORDBAN,ORDINQ,ORDPRP
PUBL ORDCIU,ORDCLI,ORDMAR,ORDPRV,ORDPRO,ORDBAN,ORDINQ,ORDPRP

RELE SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,BOTOM,PAIP,SUCU,JANNRO,CANT_EMPRE,PROBE,PROBES,SSTM1
PUBL SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,BOTOM,PAIP,SUCU,JANNRO,CANT_EMPRE,PROBE,PROBES,SSTM1
RELE ABA,TEX_EFES,SSTM2
PUBL ABA,TEX_EFES,SSTM2

TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
SSTM2="CAJAABAJ"
ABA="Abriendo Base de "
cant_empre=1
probe="Proveedor"
probes="Proveedores"
JANNRO=1
sucu='0000'
nul=0
paip='|'
botom='  '+repl("ฐ",78)
SSTM=padc('Caja',19)
SSTM1="ADMIN"
ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
TEN='Existe - [ENTER] para Continuar'
NLQ=CHR(27)+CHR(120)+CHR(1)+CHR(27)+CHR(107)+CHR(0)
OFFNLQ=CHR(27)+CHR(120)+CHR(0)+CHR(18)
UNDER=CHR(27)+CHR(45)+CHR(1)
OFFUNDER=CHR(27)+CHR(45)+CHR(0)
WIDE=CHR(27)+CHR(87)+CHR(1)
OFFWIDE=CHR(27)+CHR(87)+CHR(0)
*
=TER_SMO1(3)
*
STORE 36 TO RH
STORE 47 TO RP
STORE REPL("!",10) TO X10
STORE REPL("!",15) TO X15
STORE REPL("!",20) TO X20
STORE REPL("!",30) TO X30
=GETGENE()
STORE "ADMINISTRACION RAFULS" TO JANNAME
COEFSEG=1
USADOR=GETENV("USERNAME")
RELE PDS
PUBL PDS[2]
PDS[1]=132
PDS[2]=233
=OPMIX()
XACDIGI=GETNU1("XACDIGI","FOXGRL")
*
* Inserted from DEFINES.PRG
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE FOLL  .F.                                && FOLL
#DEFINE TRUC  ".T."                              && TRUC
#DEFINE TRUL  .T.                                && TRUL
#DEFINE IMPRIMIENDO  PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ') && IMPRIMIENDO
#DEFINE ELYES  "SI"                              && ELYES
#DEFINE ELNOU  "NO"                              && ELNOU
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE THREE  3                                 && THREE
#DEFINE FOUR   4                                 && FOUR
#DEFINE TEX_EFES " - [F2] Popup - [F3] Bฃsqueda" && TEX_EFES
#DEFINE TEX_CALC "CALCULANDO - ESPERE POR FAVOR" && TEX_CALC
#DEFINE GRABANDO PADC(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
#DEFINE NOVACIO "CAMPO DE INGRESO OBLIGATORIO - NO PUEDE ESTAR VACIO" && NOVACIO
#DEFINE NOFECHA "LAS FECHAS ESTAN ENTRE VALORES INACEPTABLES" && NOFECHA
#DEFINE ESPAOPC " - Barra Espac. para cambiar de Opciขn" && ESPAOPC
#DEFINE ESCANUL " - [ESC] para Anular"           && ESCANUL
#DEFINE ESCAMEN " - [ESC] para Menฃ"             && ESCAMEN
#DEFINE ESCAFIN " - [ESC] para Fin"              && ESCAFIN
#DEFINE NOACVAL "LOS VALORES INGRESADOS ESTAN ENTRE LIMITES INACEPTABLES"    && NOACVAL
#DEFINE CONTIX  " Continuaciขn"                  && CONTIX
#DEFINE RH      36  && RH
#DEFINE RP 47  && RP
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
#DEFINE ORQ      "Orden de Requerimiento"        && ORQ
#DEFINE ORQS     "Ordenes de Requerimiento"      && ORQS
#DEFINE NOSEL "NO SE HA SELECCIONADO"            && NOSEL
#DEFINE PIC30 "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" && PIC30
#DEFINE T_REINGRE "Reingrese el DATO"  && T_REINGRE
* End of inserted lines
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
=OPDOC()
ACTI WIND THERMO
=TER_SMO1(3)
ULPR=PROGRAM()
ACTI SCRE
=CABPAN1()
RELE WIND THERMO

*       ึฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤท
*       บ                      Menu Definition                    บ
*       ำฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฝ
*
DEFI MENU main MESS 'MENU PRINCIPAL - SISTEMA DE CAJA PUBLICO - ADMINISTRACION RAFULS' shad colo sche 3
DEFI PAD _r2f15dp1j OF MAIN PROM "\<Varios" COLOR SCHEME 3  AT 1,0
DEFI PAD _r2f15dp28 OF MAIN PROM "\<Ingreso" COLOR SCHEME 3 AT 1,7
DEFI PAD _r2f15dp2q OF MAIN PROM "\<Egreso" COLOR SCHEME 3 AT 1,15
DEFI PAD _r2f15dp2u OF MAIN PROM "I\<mpuestos" COLOR SCHEME 3 AT 1,22
DEFI PAD _r2f15dp2w OF MAIN PROM "\<Factura" COLOR SCHEME 3 AT 1,32
DEFI PAD _r2f15dp30 OF MAIN PROM "\<Banco" COLOR SCHEME 3 AT 1,40
DEFI PAD _r2f15dp32 OF MAIN PROM "I\<nforme" COLOR SCHEME 3 AT 1,46
DEFI PAD _r2f15dp36 OF MAIN PROM "V\<ariables" COLOR SCHEME 3 AT 1,54
DEFI PAD _r2f15dp3a OF MAIN PROM "C\<hau" COLOR SCHEME 3 AT 1,64

ON PAD _r2f15dp1j OF MAIN ACTI POPU varios
ON PAD _r2f15dp28 OF MAIN ACTI POPU ingreso
ON PAD _r2f15dp2q OF MAIN ACTI POPU egreso
ON PAD _r2f15dp2u OF MAIN ACTI POPU impuestos
ON PAD _r2f15dp2w OF MAIN ACTI POPU factura
ON PAD _r2f15dp32 OF MAIN ACTI POPU informe
ON PAD _r2f15dp36 OF MAIN ACTI POPU variables
ON SELE PAD _r2f15dp3a OF MAIN QUIT

DEFINE POPU varios MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF varios PROM "\<Bancos"
DEFI BAR 2 OF varios PROM "\<Control de Impresoras"
DEFI BAR 3 OF varios PROM "\<Tipo de Gasto"
DEFI BAR 4 OF varios PROM "\<Mensajes"
ON SELE BAR 1 OF varios DO BAN
ON SELE BAR 2 OF varios DO OPCIMP
ON SELE BAR 3 OF varios DO GAS
ON BAR 4 OF varios ACTI POPU mensajes

DEFINE POPU mensajes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF mensajes PROM "\<Envกa Mensaje"
DEFI BAR 2 OF mensajes PROM "Mensajes En\<viados"
DEFI BAR 3 OF mensajes PROM "Mensajes \<Recibidos"
DEFI BAR 4 OF mensajes PROM "Res\<ponde Mensajes"
ON SELE POPU mensajes DO MENSAJ

DEFINE POPU ingreso MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF ingreso PROM "Cobrado \<Expensas"
DEFI BAR 2 OF ingreso PROM "\<Pago Alquileres a Cuenta"
DEFI BAR 3 OF ingreso PROM "Inquilinos \<SIN CONTRATO"
DEFI BAR 4 OF ingreso PROM "Cobrado \<Alquileres e Impuestos"
DEFI BAR 5 OF ingreso PROM "\<Indexa Base de Caja"
DEFI BAR 6 OF ingreso PROM "\-" SKIP FOR .t.
DEFI BAR 7 OF ingreso PROM "\<Recibos Bancarios"
ON SELE BAR 1 OF ingreso DO _r2f15dp6g
ON SELE BAR 2 OF ingreso DO PAGACU.SPR
ON SELE BAR 3 OF ingreso DO PAGACU.SPR WITH .T.
ON SELE BAR 4 OF ingreso DO _r2f15dp70
ON SELE BAR 5 OF ingreso DO XCAJ
ON BAR 7 OF ingreso ACTI POPU recibosban

DEFINE POPU recibosban MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF recibosban PROM "\<Emite Un Recibo p/banco"
DEFI BAR 2 OF recibosban PROM "\-" ;
  SKIP FOR .t.
DEFI BAR 3 OF recibosban PROM "\<Recepciขn Planilla de Cobro"
DEFI BAR 4 OF recibosban PROM "\<Modifica Recibo"
DEFI BAR 5 OF recibosban PROM "\-" ;
  SKIP FOR .T.
DEFI BAR 6 OF recibosban PROM "\<Listados por Pantalla"
DEFI BAR 7 OF recibosban PROM "L\<istados por Impresora"
ON SELE POPU RECIBOSBAN DO RECB

DEFINE POPU egreso MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF egreso PROM "Paga Factura de \<Consorcio"
DEFI BAR 2 OF egreso PROM "Paga Factura de \<Terceros"
DEFI BAR 3 OF egreso PROM "Paga Factura de \<Administraciขn"
DEFI BAR 4 OF egreso PROM "\<Egreso de Efectivo"
DEFI BAR 5 OF egreso PROM "Egreso de C\<heques de Terceros"
DEFI BAR 6 OF egreso PROM "Egreso de Cheques \<Propios"
ON SELE POPU EGRESO DO EGRESO

DEFINE POPU impuestos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF impuestos PROM "\<Ingresa Impuesto a Pagar"
DEFI BAR 2 OF impuestos PROM "\<Entrega Impuesto a Inquilino"
DEFI BAR 3 OF impuestos PROM "\<Recibo Impuesto Pago"
DEFI BAR 4 OF impuestos PROM "Paga Impuesto de \<Propietario"
DEFI BAR 5 OF impuestos PROM "Paga Impuesto de I\<nquilino"

ON SELE BAR 1 OF impuestos DO _r2f15dpcw
ON SELE BAR 2 OF impuestos DO _r2f15dpd9
ON SELE BAR 3 OF impuestos DO _r2f15dpdm
ON SELE BAR 4 OF impuestos DO _r2f15dpdz
ON SELE BAR 5 OF impuestos DO _r2f15dpec

DEFINE POPU factura MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF factura PROM "\<Ingresa Factura a Pagar"
DEFI BAR 2 OF factura PROM "\<Autoriza"
DEFI BAR 3 OF factura PROM "\<Desautoriza"
DEFI BAR 4 OF factura PROM "\-" ;
  SKIP FOR .t.
DEFI BAR 5 OF factura PROM "Listados por \<Pantalla"
DEFI BAR 6 OF factura PROM "\<Listados por Impresora"
ON SELE BAR 1 OF factura DO PRP
ON BAR 2 OF factura ACTI POPU _qr70s3hyr
ON BAR 3 OF factura ACTI POPU _qr70s2pxs
ON BAR 5 OF factura ACTI POPU listadospo
ON BAR 6 OF factura ACTI POPU _qr71f8xa4

DEFINE POPU _qr70s3hyr MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _qr70s3hyr PROM "\<Por Propietario"
DEFI BAR 2 OF _qr70s3hyr PROM "Por \<Fecha"
ON SELE BAR 1 OF _qr70s3hyr DO _r2f15dpgu
ON SELE BAR 2 OF _qr70s3hyr DO _r2f15dph7

DEFINE POPU _qr70s2pxs MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _qr70s2pxs PROM "\<Por Propietario"
DEFI BAR 2 OF _qr70s2pxs PROM "Por \<Fecha"
ON SELE BAR 1 OF _qr70s2pxs DO _r2f15dphz
ON SELE BAR 2 OF _qr70s2pxs DO _r2f15dpib

DEFINE POPU listadospo MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF listadospo PROM "Autorizadas por \<Propietario"
DEFI BAR 2 OF listadospo PROM "Autorizadas por \<Fecha"
DEFI BAR 3 OF listadospo PROM "No autorizadas por P\<ropietario"
DEFI BAR 4 OF listadospo PROM "No autorizadas por F\<echa"
ON SELE BAR 1 OF listadospo DO _r2f15dpj9
ON SELE BAR 2 OF listadospo DO _r2f15dpjm
ON SELE BAR 3 OF listadospo DO _r2f15dpk0
ON SELE BAR 4 OF listadospo DO _r2f15dpkd

DEFINE POPU _qr71f8xa4 MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF _qr71f8xa4 PROM "Autorizadas por \<Propietario"
DEFI BAR 2 OF _qr71f8xa4 PROM "Autorizadas por \<Fecha"
DEFI BAR 3 OF _qr71f8xa4 PROM "No autorizadas por P\<ropietario"
DEFI BAR 4 OF _qr71f8xa4 PROM "No autorizadas por F\<echa"
ON SELE BAR 1 OF _qr71f8xa4 DO _r2f15dpla
ON SELE BAR 2 OF _qr71f8xa4 DO _r2f15dpln
ON SELE BAR 3 OF _qr71f8xa4 DO _r2f15dpm0
ON SELE BAR 4 OF _qr71f8xa4 DO _r2f15dpmf

DEFINE POPU informe MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF informe PROM "\<Contrato"
DEFI BAR 2 OF informe PROM "\<Inquilino"
DEFI BAR 3 OF informe PROM "\<Propietario"
DEFI BAR 4 OF informe PROM "C\<onsorcista"
DEFI BAR 5 OF informe PROM "Ca\<ja"
ON SELE BAR 1 OF informe DO _r2f15dpnf
ON BAR 2 OF informe ACTI POPU inquilino
ON SELE BAR 3 OF informe DO _r2f15dpnu
ON SELE BAR 5 OF informe do lcajCPUB

DEFINE POPU inquilino MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF inquilino PROM "\<Modifica Recibo"
DEFI BAR 2 OF inquilino PROM "\<Cuenta Corriente un Inquilino (Pantalla)"
DEFI BAR 3 OF inquilino PROM "\<Cuenta Corriente un Inquilino (Impresora)"
ON SELE BAR 1 OF inquilino DO _r2f15dpos
ON SELE BAR 2 OF inquilino DO _r2f15dpp5
ON SELE BAR 3 OF inquilino DO _r2f15dppi

DEFINE POPU variables MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF variables PROM "\<Popups a Utilizar"
DEFI BAR 2 OF variables PROM "\<Cantidad de dกgitos"
ON SELE BAR 1 OF variables DO ACPOPU.SPR
ON SELE BAR 2 OF variables DO ACDIGI

SET MARK OF MENU MAIN TO ""

*       ึฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤท
*       บ                 Cleanup Code & Procedures               บ
*       ำฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฝ
*
DO WHILE .T.
   ACTI MENU MAIN
   IF GETENV("USERNAME")="GOYO" .AND. ;
        LAST()=27
      EXIT
   ENDIF
ENDDO

PROCEDURE _r2f15dp6g
STORE .T. TO CSSPOP
STORE .T. TO ESCONSOR
DO OPINM
DO OPCNS
DO OPCNX
=OPCIU()
DO OPCAJ
=OPCCL()
DO OPCCP
DO OPCCI
=OPCLI() WITH .T.
DO ICOB WITH .T.,.T.

PROCEDURE _r2f15dp70
STORE .F. TO AFUTURO
=OPCIU()
DO OPALQ
DO OPCAJ
=OPCCL()
DO OPCCP
DO OPCCI
=OPINQ()
=OPCLI()
DO ICOB WITH .T.

PROCEDURE _r2f15dpcw
=OPMIX()
DO OPINM
DO OPALQ
=OPALQFUT(.T.)
=OPINQ()
=OPCCL()
DO OPCCI
DO OPCCP
=h_pimp()
ON SELE POPU IMPU DO IIMPU
ACTI POPU IMPU
RELE POPU IMPU

PROCEDURE _r2f15dpd9
=OPMIX()
=OPINM()
=OPALQ()
=OPALQFUT(.T.)
=OPINQ()
=OPCCL()
=OPCCI()
=OPCCP()
STORE NUL TO RESPUESTA
DO WHILE !EMPTY(ELIINM("a Entregar",-1,1,'T'))
   do eimpu
   STORE NUL TO RESPUESTA
enddo

PROCEDURE _r2f15dpdm
=OPMIX()
DO OPINM
=OPCCL()
DO OPALQ
=OPALQFUT(.T.)
=OPINQ()
DO OPCCI
DO OPCCP
STORE NUL TO RESPUESTA
DO WHILE !EMPTY(ELIINM("a Recibir",-1,1,'T'))
   DO RIMPU
   STORE NUL TO RESPUESTA
ENDDO

PROCEDURE _r2f15dpdz
=OPMIX()
DO OPINM
DO OPALQ
=OPALQFUT(.T.)
=OPINQ()
DO OPCCI
DO OPCCP

PROCEDURE _r2f15dpec
=OPMIX()
DO OPINM
DO OPALQ
=OPALQFUT(.T.)
=OPINQ()
DO OPCCI
DO OPCCP


PROCEDURE _r2f15dpgu
DO OPPRP
DO OPCCP
DO AUTFAC3

PROCEDURE _r2f15dph7
DO OPPRP
DO OPCCP
DO AUTFAC3 WITH .T.

PROCEDURE _r2f15dphz
DO OPPRP
DO OPCCP
DO DESFAC3

PROCEDURE _r2f15dpib
DO OPPRP
DO OPCCP
DO DESFAC3 WITH .T.

PROCEDURE _r2f15dpj9
DO OPPRP
DO OPCCP
FAC5=1
TT="Listado de Facturas"+;
  crlf
STORE NUL TO RESPUESTA
IF ELIPRP("a Listar",-1,1))
   FISC="CCP.PROCOD='"+PER.CODCLI+"' .AND. ;
     AUTORIZ "
   tt=tt+;
     "Autorizadas de "+alltrim(per.cliente)
   =LFAUT(.T.)
ENDIF

PROCEDURE _r2f15dpjm
DO OPPRP
DO OPCCP
FAC5=2
TT="Listado de Facturas"+;
  crlf
m.fecini=infec("win","Fecha lกmite del Listado")
IF !EMPTY(M.FECINI)
   FISC="CCP.FECHAVE<={"+DTOC(M.FECINI)+"} .AND. ;
     AUTORIZ "
   tt=tt+;
     "Autorizadas hasta el "+datecomp(m.fecini)
   =LFAUT(.T.)
ENDIF

PROCEDURE _r2f15dpk0
DO OPPRP
DO OPCCP
FAC5=1
TT="Listado de Facturas"+;
  crlf
STORE NUL TO RESPUESTA
IF ELIPRP("a Listar",-1,1))
   FISC="CCP.PROCOD='"+PER.CODCLI+"' .AND. ;
     !AUTORIZ "
   tt=tt+;
     "No autorizadas de "+alltrim(per.cliente)
   =LFAUT(.t.)
ENDIF

PROCEDURE _r2f15dpkd
DO OPPRP
DO OPCCP
FAC5=2
TT="Listado de Facturas"+;
  crlf
STORE NUL TO RESPUESTA
m.fecini=infec("win","Fecha lกmite del Listado")
IF !EMPTY(M.FECINI)
   FISC="CCP.FECHAVE<={"+DTOC(M.FECINI)+"} .AND. ;
     !AUTORIZ "
   tt=tt+;
     "No autorizadas hasta el "+datecomp(m.fecini)
   =LFAUT(.T.)
ENDIF

PROCEDURE _r2f15dpla
DO OPPRP
DO OPCCP
TT="Listado de Facturas"+;
  crlf
STORE NUL TO RESPUESTA
IF ELIPRP("a Listar",-1,1))
   FISC="CCP.PROCOD='"+PER.CODCLI+"' .AND. ;
     AUTORIZ "
   tt=tt+;
     "Autorizadas de "+alltrim(per.cliente)
   =LFAUT()
ENDIF

PROCEDURE _r2f15dpln
DO OPPRP
DO OPCCP
TT="Listado de Facturas"+;
  crlf
m.fecini=infec("win","Fecha lกmite del Listado")
IF !EMPTY(M.FECINI)
   FISC="CCP.FECHAVE <="+DTOC(M.FECINI)+" .AND. ;
     AUTORIZ "
   tt=tt+;
     "Autorizadas hasta el "+datecomp(m.fecini)
   =LFAUT()
ENDIF

PROCEDURE _r2f15dpm0
DO OPPRP
DO OPCCP
TT="Listado de Facturas"+;
  crlf
STORE NUL TO RESPUESTA
IF ELIPRP("a Listar",-1,1))
   FISC="CCP.PROCOD='"+PER.CODCLI+"' .AND. ;
     !AUTORIZ "
   tt=tt+;
     "No autorizadas de "+alltrim(per.cliente)
   =LFAUT()
ENDIF

PROCEDURE _r2f15dpmf
DO OPPRP
DO OPCCP
TT="Listado de Facturas"+;
  crlf
m.fecini=infec("win","Fecha lกmite del Listado")
IF !EMPTY(M.FECINI)
   FISC="CCP.FECHAVE <="+DTOC(M.FECINI)+" .AND. ;
     !AUTORIZ "
   tt=tt+;
     "No autorizadas hasta el "+datecomp(m.fecini)
   =LFAUT()
ENDIF

PROCEDURE _r2f15dpnf
=OPCIU()
DO OPINM
DO OPPRP
DO OPGAR
DO OPALQ
DO ALQ_RESU.SPR


PROCEDURE _r2f15dpnu
=OPCIU()
DO OPINM
DO OPCCP
DO OPPRP
DO LCPRP WITH .T.,.T.

PROCEDURE _r2f15dpos
=OPINM()
=OPINQ()
=OPCCL()
DO RECB

PROCEDURE _r2f15dpp5
=OPINQ()
=OPCCL(.T.)
DO CTACTEC1 WITH .T.
=CLOSDBF('PER')
=CLOSDBF("CCL")


PROCEDURE _r2f15dppi
=OPINQ()
=OPCCL(.T.)
DO CTACTEC1
USE IN PER
