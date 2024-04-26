SET TALK OFF
CLEA
=bigchars(2,25,'CAJA')
=BIGCHARS(12,13,'Sistemas',6)
=bigchars(17,1,'Informaticos',15)
antwin=wontop()
acti scre
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
=inkey(0,"HM")
acti wind (antwin)
do while !empty(wontop())
	rele wind (wontop())
enddo
STORE .T. TO control
DO CAJA
DO WHILE .T.
	ACTI MENU main
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
		EXIT
	ENDIF
ENDDO
RETURN
procedure caja
	*********************************************************************************
	*-- Programa: CAJA.PRG
	*-- Fecha   : 11/13/91
	*-- Version : G. REINER
	*-- Notas   : MENU SISTEMA DE CAJA
	********************************************************************************
  =GETFUSER()
	=SETEOS()
	ulpr=PROGRAM()
	CLEA
	set colo to w+
	@ 0,0,24,79 BOX REPL("°",9)
	set colo to
	cntr=0
	count=100
	last_num=0
	c=3
	=ter_smoo(' Sistema de Caja ','Construyendo Men£es','Espere por Favor')
	RELE PATH,pathcaj,PATHPRO,PATHVEN,PATHCOM,pathcpr
	PUBL PATH,pathcaj,PATHPRO,PATHVEN,PATHCOM,pathcpr
	IF FILE("F:\public\pathcaj.MEM")
		REST FROM F:\public\pathcaj ADDI
    ELSE
       IF FILE("C:\SISTEMAS\CAJA\CAJAA\PATH.MEM")
 		  REST FROM C:\SISTEMAS\CAJA\CAJAA\PATH ADDI
	   ELSE
	 	  REST FROM PATH ADDI
	   ENDIF
	ENDIF
	*************************** INICIO caja **************************
	=ter_smo1(3)
	acti scre
	@ 0,0 SAY REPLICATE("Û",80) COLO W
	@ 0,1 SAY PADC('Caja',20) COLOR I
	@ 0,23 SAY '|'
	@ 0,25 SAY DATE() COLOR I
	@ 0,34 SAY '|'
	@ 0,36 SAY TIME() COLOR I
	@ 0,45 SAY '|'
	@ 0,47 SAY PADC(PROGRAM(),10,' ') COLOR I
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
	acti scre
	=OPDOC()
	acti wind thermo
	=ter_smo1(3)
	ULPR=PROGRAM()
	acti scre
	=cabpan1()
	acti wind thermo
	=ter_smo1(3)
	************************** inicio caja
	DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE CAJA' shad
	=ter_smo1(3)
	DEFI PAD varios OF main PROM '\<Varios'    AT 01,00 COLOR SCHE 2
	DEFI PAD client OF main PROM '\<Clientes' AT 01,07 COLOR SCHE 2
	=ter_smo1(3)
	DEFI PAD provee OF main PROM '\<Proveedores' AT 01,16 COLOR SCHE 2
	DEFI PAD salida  OF main PROM '\<Salidas ' AT 01,29 COLOR SCHE 2
	=ter_smo1(3)
	DEFI PAD entrad OF main PROM '\<Entradas' AT 01,38 COLOR SCHE 2
	=ter_smo1(3)
	DEFI PAD bancos OF main PROM '\<Bancos ' AT 01,53 COLOR SCHE 2
	DEFI PAD variab OF main PROM 'V\<ariables ' AT 01,62 COLOR SCHE 2
	=ter_smo1(3)
	DEFI PAD adios  OF main PROM 'C\<hau'      AT 01,74 COLOR SCHE 2
	=ter_smo1(3)
	ON SELECTION PAD varios OF main ACTI POPUP varios
	=ter_smo1(3)
	ON SELECTION PAD client OF main ACTI POPUP client
	=ter_smo1(3)
	ON SELECTION PAD provee OF main ACTI POPUP provee
	ON SELECTION PAD salida OF main ACTI POPUP salida
	=ter_smo1(3)
	ON SELECTION PAD entrad OF main ACTI POPUP entrad
	=ter_smo1(3)
	ON SELECTION PAD bancos OF main ACTI POPUP bancos
	=ter_smo1(3)
	ON SELECTION PAD variab OF main ACTI POPUP variab
	=ter_smo1(3)
	ON SELECTION PAD adios  OF main ACTI POPUP adios
	=ter_smo1(3)
	respuesta='varios#2#0#A/B/M/L Varios#3#\<Bancos#\<Ciudades#'
	respuesta=respuesta+'\<I. V. A.#\<Provincias#\<Tipo de Gasto#\<Condiciones de Pago'
	=ter_smo1(3)
	=defpop()
	=ter_smo1(3)
	respuesta='client#2#7#Gesti¢n de Clientes#3#\<Datos Administrativos#\<Legajo del Cliente'
	=defpop()
	=ter_smo1(3)
	respuesta='provee#2#16#Gesti¢n de Proveedores#3#\<Datos Administrativos#\<Legajo del Proveedor'
	=defpop()
	=ter_smo1(3)
	respuesta='salida#2#29#Salidas de Caja#3#Pa\<go Facturas#Pago a \<Cuenta#-#Salida de \<Efectivo#Salida de C\<heques Propios#-#Pagos por \<Pantalla#Pagos por \<Impresora#-#C. C. Proveed. por P\<antalla#C. C. Proveed. por I\<mpresora'
	=defpop()
	=ter_smo1(3)
	respuesta='entrad#2#38#Entradas de Caja#3#Ingreso \<Cobros#\<A Cuenta#-#Ingreso \<Efectivo y cheques#-#Ingresos por \<Pantalla#Ingresos por \<Impresora#-#C. C. Clientes por P\<antalla#C. C. Clientes por I\<mpresora#-#C\<orrige Cobros#Reimp\<uta pagos#\<Salda Cta Cte'
	=defpop()
	=ter_smo1(6)
	respuesta='bancos#2#53#Sistema de Bancos#3#\<Transferencia de Fondos#\<Acreditaci¢n de Cheques#-#A\<juste de Cta Cte#\<Dep¢sito en efectivo#-#Listados por \<Pantalla#Listados por \<Impresora'
	=defpop()
	=ter_smo1(3)
	respuesta='variab#2#50#Mantenimiento de variables del sistema#3#\<Popups a Utilizar#Ancho de la \<Impresora#Ancho de la \<Hoja#'
	respuesta=respuesta+'\<Cantidad de D¡gitos#\<Denominaci¢n Moneda#N§ Doc\<umentaci¢n#\<Orden de los Listados#Coti\<zaci¢n del D¢lar'
	=ter_smo1(3)
	=defpop()
	=ter_smo1(3)
	respuesta='adios#2#53#Se va del Sistema#3#ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»#º         \<Chau        º#ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼'
	=defpop()
	ON SELE POPUP varios DO varios
	ON SELE POPUP client DO client
	=ter_smo1(3)
	ON SELE POPUP provee DO provee
	ON SELE POPUP salida DO salida
	=ter_smo1(3)
	ON SELE POPUP entrad DO entrad
	ON SELE POPUP bancos DO bancos
	=ter_smo1(3)
	ON SELE POPUP variab DO vari
	ON SELE POPUP adios  DO adios
	rele cntr,count,last_num,segu,c
	=relewin("thermo")
	DO WHILE .T.
		ACTI MENU main
		IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .or. getenv("USERNAME")="GOYO"
			EXIT
		ENDIF
	ENDDO
	******************** FIN CAJA *************************************
RETURN
*: EOF: CAJA.PRG
*********************************************
procedure genvar
	=VAR_BAN()
	=VAR_CIU()
	=VAR_CLI()
	=VAR_GAS()
	=VAR_GRU()
	=VAR_MER()
	=VAR_PAG()
	=VAR_PRO()
	=VAR_PRV()
	=VAR_RUB()
	=VAR_OPK()
	=VAR_TAR()
	=VAR_VIA()
	=VAR_VIX()
	=VAR_ZON()
	PUBL JANpop,JANpopr,JANpopc
	publ ipedr,ipedc,ipedan,ipedla
	PUBL iremc,iremr,ireman,iremla
	PUBL ifacc,ifacr,ifacan,ifacla
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor
	PUBL mader,maders,genped,genrem
	PUBL rh,rp,x10,X15,x20,x30,ordpro,xadol,xadols,xamoneda,xacotiz
	PUBL xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis,biaja,biajas
	PUBL JANNRO, JANNAME
    =GETPOCAJ()
	rele ordciu,ordcli,ordMar,ordprv,ordpro,ordban
	publ ordciu,ordcli,ordMar,ordprv,ordpro,ordban

	RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,nul,botom,paip,SUCU,JANNRO,cant_empre,probe,probes,SSTM1,ABA
	PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,nul,botom,paip,SUCU,JANNRO,cant_empre,probe,probes,SSTM1,ABA

	RELE TEX_EFES,SSTM2
	PUBL TEX_EFES,SSTM2

  TEX_EFES=" - [F2] Popup - [F3] B£squeda"
  SSTM2="CAJA"
  ABA="Abriendo Base de "

	cant_empre=1
	probe="Proveedor"
	probes="Proveedores"

	JANNRO=4
	sucu='0000'
	nul=0
	paip='|'
	botom='  '+repl("°",78)
	SSTM=padc('Caja',19)
	SSTM1="MORFI"
	ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"°")
	GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"°")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"°")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°')
	TEN='Existe - [ENTER] para Continuar'
	nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
	offnlq=chr(27)+chr(120)+chr(0)+chr(18)
	UNDER=CHR(27)+CHR(45)+CHR(1)
	OFFUNDER=CHR(27)+CHR(45)+CHR(0)
	WIDE=CHR(27)+CHR(87)+CHR(1)
	OFFWIDE=CHR(27)+CHR(87)+CHR(0)
RETURN
*: EOF: GENVAR.PRG
procedure genvar1
	STORE 36 TO rh
	STORE 47 TO rp
	STORE REPL("!",10) TO x10
	STORE REPL("!",15) TO x15
	STORE REPL("!",20) TO x20
	STORE REPL("!",30) TO x30

	IF FILE((PATHVEN+'\GENE.MEM'))
	   REST FROM (PATHVEN+'\GENE') ADDI
	ELSE
	   IF FILE("C:\SISTEMAS\VENTAS\VENTASA\GENE.MEM")
		  REST FROM C:\SISTEMAS\VENTAS\VENTASA\GENE.MEM ADDI
	   ELSE
		  REST FROM (PATH+'\GENE') ADDI
	   endif
	ENDIF

	STORE 'Peso' TO austral
	STORE 'Pesos' TO australes
	STORE 'TODAS LAS EMPRESAS' TO janname
	store 'Vendedor' to biaja
	store biaja+"es" to biajas
	coefseg=1
	usador=GETENV("USERNAME")
	rele pds
	PUBL pds[2]
	pds[1]=132
	pds[2]=233
	genped=.F.
	genrem=.F.
RETURN
