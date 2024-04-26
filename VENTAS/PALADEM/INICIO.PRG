*:*********************************************************************
** VERSION PALADEM/GUILLRMO DEMONTI/GAMBACURTA
*:*********************************************************************
*:
*:        Program: INICIO.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/26/91     11:36
*:
*:      Documented 09/26/91 at 11:42               FoxDoc  version 2.01
*:*********************************************************************
EXTERNAL PROCEDURE IM_LIN
EXTERNAL PROCEDURE FINIMPR
SET TALK OFF
SET ESCA OFF
CLEA
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
	=ter_SMO1(2)
	=VAR_CIU()
		=ter_SMO1(2)
	=VAR_CLI()
		=ter_SMO1(2)
	=VAR_GRU()
		=ter_SMO1(2)
	=VAR_LIN()
		=ter_SMO1(2)
	=VAR_MAT()
		=ter_SMO1(2)
	=VAR_MER()
		=ter_SMO1(2)
	=VAR_PAG()
		=ter_SMO1(2)
	=VAR_PRO()
		=ter_SMO1(2)
	=VAR_PRV()
		=ter_SMO1(2)
	=VAR_RUB()
		=ter_SMO1(2)
	=VAR_OPK()
		=ter_SMO1(2)
	=VAR_MAR()
		=ter_SMO1(2)
	=VAR_TAR()
		=ter_SMO1(2)
	=VAR_VIA()
		=ter_SMO1(2)
	=VAR_VIX()
		=ter_SMO1(2)
	=VAR_ZON()
	publ ipedr,ipedc,ipedan,ipedla
	PUBL JANPop,JANpopr,JANpopc
	PUBL merpop,merpopr,merpopc
	PUBL iremc,iremr,ireman,iremla
	PUBL ifacc,ifacr,ifacan,ifacla
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL abio,abios,tella,tellas,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor,JANNRO
	PUBL mader,maders,genped,genrem
	PUBL rh,rp,x10,X15,x20,x30,xadol,xadols,xamoneda,xacotiz
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis
	=ter_SMO1(2)
  =GETPOVEN()

	RELE ordban,ordciu,ordcli,ordmar,ordMER,ordopk,ordprv,ordrub,ordvia,ordzon,ordpro,ordmar
	PUBL ordban,ordciu,ordcli,ordmar,ordMER,ordopk,ordprv,ordrub,ordvia,ordzon,ordpro,ordmar

	RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,BIAJA,BIAjas,ENASCII,CANT_EMPRE,probe,probes,SSTM1,ABA
	PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,biaja,biajas,ENASCII,CANT_EMPRE,probe,probes,SSTM1,ABA

	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

  SSTM2="VENTAS"
	TEX_EFES=" - [F2] Popup - [F3] B£squeda"
  ABA="Abriendo Base de "

	probe="Proveedor"
	probes="Proveedores"
	CANT_EMPRE=1
	sucu='0000'
	biaja='Fletero'
	biajas='Fleteros'
	TECMEN=" [ENTER] para Men£"
	TECMOD=" [TECLA] y [ENTER] modifica"
	botom='  '+repl(iif(iscolor(),'Û','°'),78)
	OPC_SEX="@M Hombre,Mujer,Colegial,J¢venes,Unisex,No"
	PAIP='|'
	STOR 0 TO NUL,numim
	SSTM=padc('Ventas',19)
	SSTM1="MORFI"
	ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"°")
	GRABANDO=padc(' Grabando datos - Espere por Favor ',80,"°")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"°")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°')
	TEN='Existe - [ENTER] para Continuar'
	JANNAME=' '
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
	IF FILE("C:\SISTEMAS\VENTAS\VENTASA\GENE.MEM")
		REST FROM C:\SISTEMAS\VENTAS\VENTASA\GENE ADDI
    ELSE
       IF FILE(PATH+'\GENE.MEM')
          REST FROM (PATH+'\GENE') ADDI
	   ELSE
		  REST FROM GENE ADDI
		ENDIF
	ENDIF
	STORE 'Rubro' TO ruvro
	STORE 'Rubros' TO ruvros
	RELE COEFSEG,USN
	PUBL COEFSEG,USN
	IF FILE("F:\PUBLIC\MONDAY.PAS") .AND. EMPTY(GETENV("RED"))
		COEFSEG=SEGURI1()
		usador=GETENV("USERNAME")
	ELSE
		COEFSEG=SEGURIC()
		usador=USN
	ENDIF
	IF EMPTY(COEFSEG)
		QUIT
	ENDIF
	rele pds
	PUBL pds[2]
	pds[1]=132
	pds[2]=233
	store .f. to genped,genrem
RETURN .t.
procedure ventas
	*********************************************************************************
	*-- Programa: VENTAS.PRG
	*-- Fecha   : 07/01/91 10:55am
	*-- Version : G. REINER
	*-- Notas   : MENU SISTEMA DE VENTAS
	********************************************************************************
=GETFUSER()
=SETEOS()
	ulpr=PROGRAM()
	if !iscolor()
		CLEA
		set colo to w+
		@ 0,0,24,79 BOX REPL("°",9)
		set colo to
	endif
	store 0 to cntr,last_num
	count=100
	c=3
	=ter_smoo('Sistema de Ventas','Construyendo Men£es','Espere por Favor')
	set colo to
	RELE PATH,pathpro,PATHVEN,PATHCOM
	PUBL PATH,pathpro,PATHVEN,PATHCOM

	IF FILE("F:\PUBLIC\pathven.MEM")
	   REST FROM ("F:\PUBLIC\pathven") ADDI
	ELSE
       IF FILE("C:\SISTEMAS\VENTAS\VENTASA\PATH.MEM")
		  REST FROM C:\SISTEMAS\VENTAS\VENTASA\PATH ADDI
	   ELSE
		  REST FROM path ADDI
	   ENDIF
	ENDIF
	*************************** INICIO comercializacion **************************
	=ter_SMO1(2)
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
	=ter_SMO1(2)
	=genvar1()
	=ter_SMO1(2)
	acti scre
	do opaud
	acti wind thermo
	=ter_SMO1(2)
	acti scre
	do opseg
	acti wind thermo
	=ter_SMO1(2)
	do OPDOC WITH 2
	ACTI WIND THERMO
	=ter_SMO1(2)
	DO OPEMP
	IF !CHEQEMPR()
	   QUIT
	ENDIF
	JANNAME=MIX.TEXTO1
	acti wind thermo
	=ter_SMO1(2)
	ULPR=PROGRAM()
	=IAUD("INICIO DE OPERACION")
	acti scre
	=cabpan1()
	acti wind thermo
	=ter_SMO1(2)
	************************** inicio comercializacion
	DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE VENTAS' shad COLO SCHE 2
	DEFI PAD varios OF main PROM '\<Varios'     AT 01,00 COLO SCHE 2
	DEFI PAD mercad OF main PROM '\<Mercader¡a' AT 01,07 COLO SCHE 2
	=ter_SMO1(2)
	DEFI PAD client OF main PROM '\<Clientes'   AT 01,18 COLO SCHE 2
	DEFI PAD PEDIDO OF main PROM '\<N. Pedido'  AT 01,27 COLO SCHE 2
	DEFI PAD remito OF main PROM '\<Remitos'    AT 01,37 COLO SCHE 2
	=ter_SMO1(2)
	DEFI PAD factur OF main PROM '\<Facturas'   AT 01,45 COLO SCHE 2
	DEFI PAD CTACTE OF main PROM 'C\<ta. Cte.'  AT 01,54 COLO SCHE 2
	DEFI PAD variab OF main PROM 'V\<ariables'  AT 01,64 COLO SCHE 2
	=ter_SMO1(2)
	DEFI PAD adios  OF main PROM 'C\<hau'       AT 01,74 COLO SCHE 2
	ON sele PAD varios OF main ACTI popu varios
	ON sele PAD mercad OF main ACTI popu mercad
	ON sele PAD client OF main ACTI popu client
	=ter_SMO1(2)
	ON sele PAD pedido OF main ACTI popu pedido
	ON sele PAD remito OF main ACTI popu remito
	ON sele PAD factur OF main ACTI popu factur
	=ter_SMO1(2)
	ON sele PAD ctacte OF main ACTI popu ctacte
	ON sele PAD variab OF main ACTI popu variab
	ON sele PAD adios  OF main ACTI popu adios
	=ter_SMO1(2)
	respuesta='varios#2#0#A/B/M/L Varios#3#\<Bancos#\<Ciudades#Co\<ndiciones de Venta#'
	respuesta=respuesta+'\<I. V. A.#\<Marcas#\<Proveedores#Pr\<ovincias#\<Rubros#\<'+BIAJAS+'#\<Zonas#Zonas de \<'+BIAJAS
	respuesta=respuesta+'#-#Control I\<mpresoras#-#Env¡a Mensa\<je'
	=ter_SMO1(2)
	=defpop()
	=ter_SMO1(2)
	respuesta='mercad#2#7#A/B/M/L Mercader¡as#3#\<Mercader¡as#\<Precios #\<Stock#\<Ingreso Mercader¡as#\<Kardex'
	=DEFPOP()
	=ter_smo1(6)
	respuesta='client#2#18#Gesti¢n de Clientes#3#\<Datos Administrativos#\<Legajo del Cliente'
	=ter_SMO1(2)
	=DEFPOP()

=ter_SMO1(2)
respuesta='PEDIDO#2#27#Gesti¢n de Notas de Pedido#3;
#\<Recepci¢n Nota de Pedido;
#Agrega \<Linea;
#-;
#B\<orra L¡nea;
#\<Borra Nota de Pedido;
#-;
#L\<ista por Impresora;
#Lista por \<Pantalla;
#-;
#R\<estaura el Archivo'

=ter_SMO1(2)
=DEFPOP()

=ter_SMO1(2)
respuesta='REMITO#2#37#Gesti¢n de Remitos#3#Remito de \<Nota de Pedido#\<Remito a Clientes#Remito a \<Fleteros#-#\<Devoluci¢n#\<Anula Remito#-#Lista por \<Pantalla#Lista por \<Impresora#-#R\<estaura el Archivo'

=ter_SMO1(2)
=DEFPOP()

=ter_SMO1(2)
respuesta='FACTUR#2#45#Gesti¢n de Facturaci¢n#3;
#Factura \<de Remito;
#\<Factura Directa;
#-;
#Lista \<por Pantalla;
#\<Lista por Impresora;
#-;
#Fa\<cturas Faltantes;
#Factura \<Anulada;
#-;
#Resta\<ura el Archivo'

=ter_SMO1(2)
=DEFPOP()

=ter_SMO1(2)
respuesta='ctacte#2#54#Gesti¢n de Cuenta Corriente de Clientes#3#Notas de \<D‚bito#Notas de \<Cr‚dito#C\<obrado a Clientes#\<Estado de Cuenta#-#\<Restaura el Archivo'

=ter_SMO1(2)
=DEFPOP()

=ter_SMO1(2)
	respuesta='variab#2#50#Mantenimiento de variables del sistema#3#\<Popups a Utilizar#Ancho de la \<Impresora#Ancho de la \<Hoja#'
	respuesta=respuesta+'\<Cantidad de D¡gitos#\<Denominaci¢n Moneda#\<Orden Listados#P\<recios por Defecto#\<Stocks por Defecto'
	respuesta=respuesta+'#D\<enominaci¢n Precios#N§ \<Lista de Precios#N§ Doc\<umentaci¢n#Selecci¢n \<Mercader¡a#Coti\<zaci¢n '+xadol
	=ter_SMO1(2)
	=DEFPOP()
	=ter_SMO1(2)
	respuesta='adios#2#53#Se va del Sistema#3#ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»#º         \<Chau        º#ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼'
	=ter_SMO1(2)
	=DEFPOP()
	=ter_SMO1(2)
	ON SELE popu varios DO varios
	ON SELE popu mercad DO mercad
	ON SELE popu client DO client WITH 20
	ON SELE popu pedido DO pedido
	ON SELE popu remito DO remito
	=ter_SMO1(2)
	ON SELE popu factur DO factura
	ON SELE popu ctacte DO ctactec
	ON SELE popu variab DO variab
	ON SELE popu adios DO adios
	=ter_SMO1(2)
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
