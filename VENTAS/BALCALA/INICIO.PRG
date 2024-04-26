* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-25-93                                                    บ
* บ HORA       : 10:52:25pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
CLEA
SET TALK OFF
SET ESCA OFF
=GETFUSER()
=bigletT(2,1,'VENTAS')
=BIGCHARS(12,13,'Sistemas')
=bigchars(17,1,'Informaticos',10)
store 0 to nul
=men_lin("TECLA PARA CONTINUAR")
=inkey(0,'HM')
do while !empty(wontop())
rele wind (wontop())
enddo
DO VENTAS
DO WHILE .T.
   ACTI MENU main
   IF GETENV("USERNAME")="GOYO" .or. GETENV("EQUIPO")="MICASA"
      EXIT
   ENDIF
ENDDO
RETURN
*:*********************************************************************
*:
*:        Program: GENVAR.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/19/91     11:54
*:
*:      Called by: COMER.PRG
*:
*:      Documented 09/26/91 at 11:43               FoxDoc  version 2.01
*:*********************************************************************
function genvar
=VAR_BAN()
=VAR_CIU()
=VAR_CLI()
=VAR_MER()
=VAR_PAG()
=VAR_PRO()
=VAR_PRV()
=VAR_RUB()
=VAR_VIA()
=VAR_VIX()
=VAR_ZON()
=VAR_TAR()
PUBL iremc,iremr,ireman,iremla
PUBL ifacc,ifacr,ifacan,ifacla
publ ipedr,ipedc,ipedan,ipedla
PUBL opkpop,iopkr,iopkc,iopkan,iopkla,copkr,copkc,copkla,copkan,opkpopr,opkpopc,mopkc,mopkr,mopkan,mopkla,vopkr,vopkc,vopkan,vopkla
PUBL MARpop,iMARr,iMARc,iMARla,iMARan,cMARc,cMARr,cMARan,cMARla,MARpopc,MARpopr,vMARc,vMARr,vMARan,vMARla,mMARc,mMARr,mMARla,mMARan
PUBL JANPop,JANpopr,JANpopc
PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
PUBL abio,abios,tella,tellas,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor,JANNRO
PUBL mader,maders,genped,genrem
PUBL rh,rp,x10,X15,x20,x30,xadol,xadols,xamoneda,xacotiz
PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .or. GETENV("EQUIPO")="MICASA"
   REST FROM posic ADDI
ELSE
   REST FROM ('F:\usr\'+getenv("username")+"\posicCOM") ADDI
ENDIF
RELE ordban,ordciu,ordcli,ordmar,ordMER,ordopk,ordprv,ordrub,ordvia,ordzon,ordpro,ordmar
PUBL ordban,ordciu,ordcli,ordmar,ordMER,ordopk,ordprv,ordrub,ordvia,ordzon,ordpro,ordmar

RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,BIAJA,BIAjas,ENASCII,CANT_EMPRE,probe,probes,SSTM1
PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,biaja,biajas,ENASCII,CANT_EMPRE,probe,probes,SSTM1
	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

  TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
  SSTM2="VENTAS"

ABA="Abriendo Base de "

probe="Proveedor"
probes="Proveedores"
CANT_EMPRE=1
sucu='0001'
biaja='Fletero'
biajas='Fleteros'
TECMEN=" [ENTER] para Menฃ"
TECMOD=" [TECLA] y [ENTER] modifica"
botom='  '+repl(iif(iscolor(),'Û','ฐ'),78)
OPC_SEX="@M Hombre,Mujer,Colegial,Jขvenes,Unisex,No"
PAIP='|'
STOR 0 TO NUL,numim
SSTM=padc('Ventas',19)
SSTM1="MORFI"
ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
TEN='Existe - [ENTER] para Continuar'
JANNAME='TODAS LAS EMPRESAS'
nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
offnlq=chr(27)+chr(120)+chr(0)+chr(18)
UNDER=CHR(27)+CHR(45)+CHR(1)
OFFUNDER=CHR(27)+CHR(45)+CHR(0)
WIDE=CHR(27)+CHR(87)+CHR(1)
OFFWIDE=CHR(27)+CHR(87)+CHR(0)
RETURN .t.
*:*********************************************************************
*:
*:        Program: GENVAR1.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/10/91     11:17
*:
*:      Called by: COMER.PRG
*:
*:      Documented 09/26/91 at 11:43               FoxDoc  version 2.01
*:*********************************************************************
function genvar1
STORE 36 TO rh
STORE 47 TO rp
STORE REPL("!",10) TO x10
STORE REPL("!",15) TO x15
STORE REPL("!",20) TO x20
STORE REPL("!",30) TO x30
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
   REST FROM (PATH+'\GENE') ADDI
ELSE
IF GETENV("EQUIPO")="MICASA"
   REST FROM GENE ADDI
ELSE
   REST FROM (PATHcom+'\GENE') ADDI
   ENDIF
ENDIF
STORE 'Rubro' TO ruvro
STORE 'Rubros' TO ruvros
RELE COEFSEG,USER_NO
PUBL COEFSEG,USER_NO
COEFSEG=SEGURI1()
IF EMPTY(COEFSEG)
QUIT
ENDIF
usador=GETENV("USERNAME")
rele pds
PUBL pds[2]
pds[1]=132
pds[2]=233
store .f. to genped,genrem
RETURN .t.
*: EOF: GENVAR1.PRG
procedure ventas
*********************************************************************************
*-- Programa: VENTAS.PRG
*-- Fecha   : 07/01/91 10:55am
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE VENTAS
********************************************************************************
=SETEOS()
ulpr=PROGRAM()
if !iscolor()
   CLEA
   set colo to w+
   @ 0,0,24,79 BOX REPL("ฐ",9)
   set colo to
endif
store 0 to cntr,last_num
count=100
c=3
=ter_smoo('Sistema de Comercializaciขn','Construyendo Menฃes','Espere por Favor')
set colo to
RELE PATH,pathpro,PATHVEN
PUBL PATH,pathpro,PATHVEN
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .or. GETENV("EQUIPO")="MICASA"
   IF FILE("f:\SISTEMAS\ventas\ventasa\path.MEM")
      REST FROM f:\SISTEMAS\ventas\ventasa\path ADDI
   ELSE
      REST FROM path ADDI
   ENDIF
ELSE
   REST FROM ("F:\PUBLIC\pathCOM") ADDI
ENDIF
*************************** INICIO comercializacion **************************
=ter_smo1(3)
acti scre
@ 0,0 SAY REPLICATE("Û",80) COLO W
@ 0,1 SAY PADC('Ventas',20) COLO I
@ 0,23 SAY '|'
@ 0,25 SAY DATE() COLO I
@ 0,34 SAY '|'
@ 0,45 SAY '|'
@ 0,58 SAY '|'
acti wind thermo
set shad on
=genvar()
=ter_smo1(3)
=genvar1()
=ter_smo1(3)
acti scre
=opaud()
acti wind thermo
=ter_smo1(3)
acti scre
=opseg()
acti wind thermo
=ter_smo1(3)
=OPDOC()
ACTI WIND THERMO
=ter_smo1(3)
DO OPEMP
acti wind thermo
=ter_smo1(3)
ULPR=PROGRAM()
=IAUD("INICIO DE OPERACION")
acti scre
=cabpan1()
acti wind thermo
=ter_smo1(3)
************************** inicio comercializacion
DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE VENTAS' shad COLO SCHE 2
DEFI PAD varios OF main PROM '\<Varios'     AT 01,00 COLO SCHE 2
DEFI PAD mercad OF main PROM '\<Mercaderกa' AT 01,07 COLO SCHE 2
=ter_smo1(3)
DEFI PAD client OF main PROM '\<Clientes'   AT 01,18 COLO SCHE 2
DEFI PAD PEDIDO OF main PROM '\<N. Pedido'  AT 01,27 COLO SCHE 2
DEFI PAD remito OF main PROM '\<Remitos'    AT 01,37 COLO SCHE 2
=ter_smo1(3)
DEFI PAD factur OF main PROM '\<Facturas'   AT 01,45 COLO SCHE 2
DEFI PAD CTACTE OF main PROM 'C\<ta. Cte.'  AT 01,54 COLO SCHE 2
DEFI PAD variab OF main PROM 'V\<ariables'  AT 01,64 COLO SCHE 2
=ter_smo1(3)
DEFI PAD adios  OF main PROM 'C\<hau'       AT 01,74 COLO SCHE 2
ON sele PAD varios OF main ACTI popu varios
ON sele PAD mercad OF main ACTI popu mercad
ON sele PAD client OF main ACTI popu client
=ter_smo1(3)
ON sele PAD pedido OF main ACTI popu pedido
ON sele PAD remito OF main ACTI popu remito
ON sele PAD factur OF main ACTI popu factur
=ter_smo1(3)
ON sele PAD ctacte OF main ACTI popu ctacte
ON sele PAD variab OF main ACTI popu variab
ON sele PAD adios  OF main ACTI popu adios
=ter_smo1(3)
respuesta='varios#2#0#A/B/M/L Varios#3#\<Bancos#\<Ciudades#Co\<ndiciones de Venta#'
respuesta=respuesta+'\<I. V. A.#\<Marcas#\<Proveedores#Pr\<ovincias#\<Rubros#\<'+BIAJAS+'#\<Zonas#Zonas de \<'+BIAJAS
respuesta=respuesta+'#-#Control I\<mpresoras#-#Envกa Mensa\<je'
=ter_smo1(3)
=defpop()
=ter_smo1(3)
respuesta='mercad#2#7#A/B/M/L Mercaderกas#3#\<Mercaderกas#\<Precios #\<Stock#\<Kardex#\<Ingreso Mercaderกas'
=DEFPOP()
=ter_smo1(6)
respuesta='client#2#18#Gestiขn de Clientes#3#\<Datos Administrativos#\<Legajo del Cliente'
=ter_smo1(3)
=DEFPOP()
=ter_smo1(3)
respuesta='PEDIDO#2#27#Gestiขn de Notas de Pedido#3#\<Recepciขn Nota de Pedido#Agrega una \<Nueva Linea#-#Corrige \<Artกculo#'
respuesta=respuesta+'Corrige \<Linea#Corrige \<Cabecera#-#\<Borra Nota de Pedido#Borra Lกnea \<Entera#-#L\<ista por Impresora#Lista por \<Pantalla#-#R\<estaura el Archivo'
=ter_smo1(3)
=DEFPOP()
=ter_smo1(3)
respuesta='REMITO#2#37#Gestiขn de Remitos#3#Remito de \<Nota de Pedido#\<Remito a Clientes#Remito a \<Fleteros#-#\<Devoluciขn#\<Anula Remito#-#Lista por \<Pantalla#Lista por \<Impresora#-#R\<estaura el Archivo'
=ter_smo1(3)
=DEFPOP()
=ter_smo1(3)
respuesta='FACTUR#2#45#Gestiขn de Facturaciขn#3#Factura \<de Remito#\<Factura Directa#-#Lista \<por Pantalla#\<Lista por Impresora#-#Fa\<cturas Faltantes#Factura \<Anulada'
=ter_smo1(3)
=DEFPOP()
=ter_smo1(3)
respuesta='ctacte#2#54#Gestiขn de Cuenta Corriente de Clientes#3#Notas de \<Dbito#Notas de \<Crdito#C\<obrado a Clientes#\<Estado de Cuenta#-#\<Restaura el Archivo'
=ter_smo1(3)
=DEFPOP()
=ter_smo1(3)
respuesta='variab#2#50#Mantenimiento de variables del sistema#3#\<Popups a Utilizar#Ancho de la \<Impresora#Ancho de la \<Hoja#'
respuesta=respuesta+'\<Cantidad de Dกgitos#\<Denominaciขn Moneda#\<Orden Listados#P\<recios por Defecto#\<Stocks por Defecto'
respuesta=respuesta+'#D\<enominaciขn Precios#Nง \<Lista de Precios#Nง Doc\<umentaciขn#Selecciขn \<Mercaderกa#Coti\<zaciขn '+xadol
=ter_smo1(3)
=DEFPOP()
=ter_smo1(3)
respuesta='adios#2#53#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
=ter_smo1(3)
=DEFPOP()
=ter_smo1(3)
ON SELE popu varios DO varios
ON SELE popu mercad DO mercad
ON SELE popu client DO client WITH 20
*ON SELE popu pedido DO pedido
ON SELE popu remito DO remito
=ter_smo1(3)
ON SELE popu factur DO factura
ON SELE popu ctacte DO ctactec
ON SELE popu variab DO variab
ON SELE popu adios DO adios
=ter_smo1(3)
rele cntr,count,last_num,segu,c
=relewin("thermo")
DO WHILE .T.
   ACTI MENU main
   IF GETENV("USERNAME")="GOYO" .or. GETENV("EQUIPO")="MICASA"
      EXIT
   ENDIF
ENDDO
******************** FIN SUELDOS **********************************
RETURN
