* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-25-93                                                    บ
* บ HORA       : 10:52:54pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE FINIMPR
SET TALK OFF
SET ESCA OFF
CLEA
=bigchars(2,12,'MERCADO')
=BIGCHARS(12,13,'Sistemas',8)
=bigchars(17,1,'Informaticos',17)
antwin=wontop()
acti scre
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
=inkey(0,"HM")
acti wind (antwin)
do while !empty(wontop())
	rele wind (wontop())
enddo
STORE .T. TO control
DO VENTAS
DO WHILE .T.
	ACTI MENU main
	IF GETENV("EQUIPO")="DESARROLLO" .or. getenv("username")="GOYO" .OR. getenv("username")="MANILDO"
		EXIT
	ENDIF
ENDDO
RETURN
PROCEDURE GENVAR
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
	PUBL calpop,icalr,icalc,icalla,icalan,ccalc,ccalr,ccalan,ccalla,calpopc,calpopr,vcalc,vcalr,vcalan,vcalla,mcalc,mcalr,mcalla,mcalan
	=VAR_CIU()
	=VAR_CLI()
	=VAR_MER()
	=VAR_MAR()
	=VAR_PRO()
	=VAR_GAS()
	=VAR_PAG()
	=VAR_PRV()
	=VAR_RUB()
	=VAR_VIA()
	=VAR_ZON()
	=VAR_BAN()
	PUBL ENVpop,iENVc,iENVr,iENVan,iENVla,cENVc,cENVr,cENVan,cENVla,ENVpopc,ENVpopr,mENVc,mENVr,mENVan,mENVla,vENVr,vENVc,vENVla,vENVan
	publ ipedr,ipedc,ipedan,ipedla
	publ ikarr,ikarc,ikaran,ikarla
	PUBL opkpop,iopkr,iopkc,iopkan,iopkla,copkr,copkc,copkla,copkan,opkpopr,opkpopc,mopkc,mopkr,mopkan,mopkla,vopkr,vopkc,vopkan,vopkla
	PUBL varpop,ivarr,ivarc,ivarla,ivaran,cvarc,cvarr,cvaran,cvarla,varpopc,varpopr,vvarc,vvarr,vvaran,vvarla,mvarc,mvarr,mvarla,mvaran
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL abio,abios,tella,tellas,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor
	PUBL mader,maders,genped,genrem
	PUBL iremr,iremc
	PUBL rh,rp,x10,X15,x20,x30,ordcli,ordmer,ordpro,ordvia,xadol,xadols,xamoneda,xacotiz
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis,BIAJA,BIAJAS,PROBE,PROBES
	PUBL SUCU
	store .F. to ordcli,ordmer,ordpro,ordvia

	=GETPOVEN()

	RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,TEC,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMEN,jannro,SSTM1
	PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,TEC,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMEN,jannro,SSTM1

	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

  SSTM2="VENTAS"
ABA="Abriendo Base de "
		TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"

	jannro=1
	BOTOM="  "+repl("ฐ",78)
	SSTM=padc('Ventas',19)
	SSTM1="MERCADO"
	PAIP='|'
	ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
	GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
	TEN='Existe - [ENTER] para Continuar'
	TECMEN=' [TECLA] para menฃ '
	TEC='[ENTER] para Continuar'
	nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
	offnlq=chr(27)+chr(120)+chr(0)+chr(18)
	UNDER=CHR(27)+CHR(45)+CHR(1)
	OFFUNDER=CHR(27)+CHR(45)+CHR(0)
	WIDE=CHR(27)+CHR(87)+CHR(1)
	OFFWIDE=CHR(27)+CHR(87)+CHR(0)
	STORE 0 TO NUL
RETURN
PROCEDURE GENVAR1
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
	STORE 36 TO rh
	STORE 47 TO rp
	STORE REPL("!",10) TO x10
	STORE REPL("!",15) TO x15
	STORE REPL("!",20) TO x20
	STORE REPL("!",30) TO x30
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("EQUIPO")="MICASA".OR. GETENV("EQUIPO")="MERCADO"
		REST FROM (PATH+'\GENE') ADDI
	ELSE
		REST FROM (PATHVEN+'\GENE') ADDI
	ENDIF
	sTORE 'ESPECIE' TO ruvro
	sTORE 'ESPECIES' TO ruvros
	probe='Remitente'
	probes='Remitentes'
	=GETJANNA()
	coefseg=1
	usador="ADMINIST"
	STORE '0000' TO SUCU
	STORE xauss TO XAMONEDA
	BIAJA='Vendedor'
	biajas='Vendedores'
	PROBE='Remitente'
	PROBES='Remitentes'
	rele pds
	PUBL pds[2]
	pds[1]=132
	pds[2]=233
	genped=.F.
	genrem=.F.
RETURN
*: EOF: GENVAR1.PRG
PROCEDURE VENTAS
	*****************************************************************************
	*-- Programa: VENTAS.PRG
	*-- Fecha   : 07/01/91 10:55am
	*-- Version : G. REINER
	*-- Notas   : MENU SISTEMA DE VENTAS
	********************************************************************************
	=getfuser()
	=seteos()
	ulpr=PROGRAM()
	CLEA
	set colo to w+
	@ 0,0,24,79 BOX REPL("ฐ",9)
	set colo to
	RELE PATH,pathpro,PATHVEN
	PUBL PATH,pathpro,PATHVEN
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV('EQUIPO')="DESARROLLO"
		IF FILE("h:\demos\argenta\path.MEM")
			REST FROM h:\demos\argenta\path ADDI
		ELSE
			REST FROM h:\demos\DIPaolo\path ADDI
		ENDIF
	ELSE
		IF FILE("h:\archivos\argenta\path.mem")
			REST FROM h:\archivos\argenta\path ADDI
		ELSE
			REST FROM path ADDI
		ENDIF
	ENDIF
	*************************** INICIO comercializacion **************************
	@ 0,0 SAY REPLICATE("Û",80) COLO W
	@ 0,1 SAY PADC('Mercado',20) COLO I
	@ 0,23 SAY '|'
	@ 0,25 SAY DATE() COLO I
	@ 0,34 SAY '|'
	@ 0,36 SAY TIME() COLO I
	@ 0,45 SAY '|'
	@ 0,47 SAY PADC("VENTAS",10) COLO I
	@ 0,58 SAY '|'
	set shad on
	STORE 0 TO NUL
	DO genvar
	DO genvar1
	DO opaud
	DO opseg
	DO OPDOC with 14
	ULPR=PROGRAM()
	=cabpan1()
	************************** inicio comercializacion
	DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE VENTAS' shad COLO SCHE 2
	DEFI PAD varios OF main PROM 'V\<arios'      AT 01,00 COLO SCHE 2
	DEFI PAD provee OF main PROM '\<Remitentes'  AT 01,07 COLO SCHE 2
	DEFI PAD mercad OF main PROM '\<Mercaderกa'  AT 01,18 COLO SCHE 2
	DEFI PAD client OF main PROM '\<Clientes'    AT 01,29 COLO SCHE 2
	DEFI PAD compras OF main PROM 'Com\<pra'    AT 01,38 COLO SCHE 2
	DEFI PAD factur OF main PROM '\<Venta'      AT 01,45 COLO SCHE 2
	DEFI PAD CTACTE OF main PROM 'C\<ta Cte'   AT 01,51 COLO SCHE 2
	DEFI PAD bancos OF main PROM '\<Bcos'      AT 01,59 COLOR SCHE 2
	DEFI PAD variab OF main PROM 'Var\<iables'   AT 01,64 COLO SCHE 2
	DEFI PAD adios  OF main PROM 'C\<hau'        AT 01,74 COLO SCHE 2
	ON sele PAD varios OF main ACTI popu varios
	ON sele PAD provee OF main ACTI popu provee
	ON sele PAD mercad OF main ACTI popu mercad
	ON sele PAD client OF main ACTI popu client
	ON sele PAD compras OF main ACTI popu compras
	ON sele PAD factur OF main ACTI popu factur
	ON sele PAD ctacte OF main ACTI popu ctacte
	ON sele PAD bancos OF main ACTI POPUP bancos
	ON sele PAD variab OF main ACTI popu variab
	ON sele PAD adios  OF main ACTI popu adios
	respuesta='varios#2#0#A/B/M/L Varios#3#\<Calidades/Tamaคos#Ci\<udades#Co\<ndiciones de Venta#\<Bancos#\<Especies#\<I. V. A.#\<Provincias#\<Tipos de Envase#\<Variedad#\<Zonas#Ve\<ndedores#\<Gastos#'
	respuesta=respuesta+'-#I\<mprime Planilla'
	=defpop()
	respuesta='provee#2#7#Gestiขn de Remitentes#3#\<Datos Administrativos#\<Legajo del Remitente'
	=defpop()
	respuesta='mercad#2#18#A/B/M/L Mercaderกas#3#Mercaderกa \<Gravada#\<Mercaderกa \<Exenta#\<Operaciones de Kardex#\<Kardex'
	=defpop()
	respuesta='client#2#29#Gestiขn de Clientes#3#\<Datos Administrativos#\<Legajo del Cliente'
	=defpop()
	*respuesta='PEDIDO#2#45#Gestiขn de Notas de Pedido#3#\<Recepciขn Nota de Pedido#Agrega una \<Nueva Linea#-#Corrige \<Artกculo#'
	*respuesta=respuesta+'Corrige \<Linea#Corrige \<Cabecera#-#\<Borra Nota de Pedido#Borra Lกnea \<Entera#-#L\<ista por Impresora#Lista por \<Pantalla#-#R\<estaura el Archivo'
	*=defpop()
	respuesta='COMPRAS#2#38#Gestiขn de Compras#3#\<Compras#-#\<Remesas#-#Li\<quidaciขn'
	=defpop()

	respuesta='FACTUR#2#45#Gestiขn de Facturaciขn#3;
	#\<Factura Por Bultos;
	#-;
	#Factura \<Sin Stock;
	#\<Imputaciขn Stock Facturas;
	#-;
	#Lista Por \<Pantalla;
	#\<Lista por Impresora;
	#-;
	#R\<eindexa Archivo'
	=defpop()

	respuesta='ctacte#2#51#Gestiขn de Cuenta Corriente de Clientes#3#Correcciขn de \<Movimientos#Notas de \<Dbito#Notas de \<Crdito#\<Estado de Cuentas#-#\<Ingreso de Cobros#-#\<Restaura el Archivo'
	=defpop()
	respuesta='bancos#2#38#Sistema de Bancos#3#\<Transferencia de Fondos#\<Emisiขn Cheques Propios#\<Acreditaciขn de Cheques#-#A\<juste de Cta Cte#-#Listados por \<Pantalla#Listados por \<Impresora'
	=defpop()
	respuesta='variab#2#50#Mantenimiento de variables del sistema#3#\<Popups a Utilizar#Ancho de la \<Impresora#Ancho de la \<Hoja#'
	respuesta=respuesta+'\<Cantidad de Dกgitos#\<Denominaciขn Moneda#\<Orden de los Listados#Nง Doc\<umentaciขn#Selecciขn \<Mercaderกa#Coti\<zaciขn del Dolar'
	=defpop()
	respuesta='adios#2#53#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
	=defpop()
	ON SELE popu varios DO varios
	ON SELE popu provee DO provee
	ON SELE popu mercad DO mercad
	ON SELE popu client DO client
	ON SELE popu compras DO compras
	ON SELE popu factur DO factura
	ON SELE popu ctacte DO ctactec
	ON SELE POPUP bancos DO bancos
	ON SELE popu variab DO vari
	ON SELE popu adios DO adios
	DO WHILE .T.
		ACTI MENU main
		IF GETENV("EQUIPO")="DESARROLLO" .OR. getenv("username")="GOYO" .OR. getenv("username")="MANILDO"
			EXIT
		ENDIF
	ENDDO
	******************** FIN SUELDOS **********************************
RETURN
