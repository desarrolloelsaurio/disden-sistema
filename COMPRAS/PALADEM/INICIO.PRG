*:*********************************************************************
EXTERNAL PROCEDURE IM_LIN
EXTERNAL PROCEDURE FINIMPR
EXTERNAL PROCEDURE SHIT
SET TALK OFF
SET ESCA OFF
CLEA
=bigletT(2,1,'COMPRAS')
=BIGCHARS(12,13,'Sistemas')
=bigchars(17,1,'Informaticos',10)
store 0 to nul
=men_lin("TECLA PARA CONTINUAR")
=inkey(0,'HM')
do while !empty(wontop())
	rele wind (wontop())
enddo
DO compras
DO WHILE .T.
	ACTI MENU main
	IF USADOR="GOYO"
		EXIT
	ENDIF
ENDDO
RETURN
*!*********************************************************************
*!
*!      Procedure: GENVAR
*!
*!      Called by: COMPRAS        (procedure in INICIO.PRG)
*!
*!   Memory Files: POSIC.MEM
*!
*!*********************************************************************
PROCEDURE genvar
	=VAR_BAN()
	=VAR_CIU()
	=VAR_CLI()
	=VAR_COL()
	=VAR_GAS()
	PUBL iremc,iremr,ireman,iremla
	PUBL ifacc,ifacr,ifacan,ifacla
	=VAR_GRU()
	=VAR_LIN()
	PUBL merpop,imerc,imerr,imeran,imerla,cmerc,cmerr,cmeran,cmerla,merpopc,merpopr,mmerc,mmerr,mmeran,mmerla,vmerr,vmerc,vmerla,vmeran,merpop1
	PUBL pagpop,ipagr,ipagc,ipagla,ipagan,cpagc,cpagr,cpagan,cpagla,pagpopc,pagpopr,vpagc,vpagr,vpagan,vpagla
	PUBL propop,ipror,iproc,iprola,iproan,cproc,cpror,cproan,cprola,propopc,propopr,vproc,vpror,vproan,vprola,mproc,mpror,mprola,mproan
	PUBL ipedr,ipedc,ipedan,ipedla
	=VAR_PRV()
	=VAR_RUB()
    =VAR_OPK()
	PUBL talpop,talpopr,talpopc
    =VAR_TAR()
	PUBL marpop,marpopr,marpopc
	PUBL JANpop,JANpopr,JANpopc
	PUBL merpop,merpopr,merpopc
	=VAR_VIA()
	=VAR_VIX()
	=VAR_ZON()
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL abio,abios,tella,tellas,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi
	PUBL mader,maders,genped,genrem,biaja,biajas
	PUBL rh,rp,x10,x15,x20,x30,xadol,xadols,xamoneda,xacotiz,xacancho,xachoja
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis

    =GETPOCPR()

	rele ordprv,ordciu,ordban,ordmer,ordpro,ordcli,ordmar
	PUBL ordprv,ordciu,ordban,ordmer,ordpro,ordcli,ordmar
	stor .f. to ordprv,ordciu,ordban,ordmer,ordpro,ordcli,ordmar

	RELE sstm,ulpr,espere,grabando,tratando,imprimiendo,largoim,linea,largo,ten,nlq,offnlq,under,offunder,wide,offwide,nul,botom,paip,TECMEN,SUCU,cant_empre,probe,probes,jannro,ENASCII,TECMOD,USER_NO,SSTM1
	PUBL sstm,ulpr,espere,grabando,tratando,imprimiendo,largoim,linea,largo,ten,nlq,offnlq,under,offunder,wide,offwide,nul,botom,paip,TECMEN,SUCU,cant_empre,probe,probes,jannro,ENASCII,TECMOD,USER_NO,SSTM1
	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

  TEX_EFES=" - [F2] Popup - [F3] B£squeda"
  SSTM2="COMPRAS"
  ABA="Abriendo Base de "
	TECMOD=" [TECLA] y [ENTER] modifica"
	store 0 to jannro,USER_NO
	CANT_EMPRE=1
	probe='Proveedor'
	probes='Proveedores'
	SUCU='0000'
	paip='|'
	botom="  "+REPL("°",78)
	JANNAME=' '
	STORE 0 TO nul
	sstm=PADC('Compras',19)
	SSTM1="MORFI"
	BIAJA="Fletero"
	BIAJAs="Fleteros"
	espere=PADC(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"°")
	grabando=PADC(' Grabando los datos ingresados - Espere por Favor ',80,"°")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"°")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°')
	ten='Existe - [ENTER] para Continuar'
	TECMEN="[ENTER] para Men£"
	nlq=CHR(27)+CHR(120)+CHR(1)+CHR(27)+CHR(107)+CHR(0)
	offnlq=CHR(27)+CHR(120)+CHR(0)+CHR(18)
	under=CHR(27)+CHR(45)+CHR(1)
	offunder=CHR(27)+CHR(45)+CHR(0)
	wide=CHR(27)+CHR(87)+CHR(1)
	offwide=CHR(27)+CHR(87)+CHR(0)
RETURN
*!*********************************************************************
*!
*!      Procedure: GENVAR1
*!
*!      Called by: COMPRAS        (procedure in INICIO.PRG)
*!
*!   Memory Files: GENE.MEM
*!
*!*********************************************************************
PROCEDURE genvar1
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
			REST FROM gene ADDI
		ELSE
			IF FILE(pathven+'\GENE.MEM')
				REST FROM (pathven+'\GENE') ADDI
			ELSE
				REST FROM C:\SISTEMAS\VENTAS\VENTASA\GENE ADDI
			ENDIF
		ENDIF
	ENDIF
	usador=GETENV("USERNAME")
	RELE pds
	PUBL pds[2]
	pds[1]=132
	pds[2]=233
	genped=.F.
	genrem=.F.
RETURN
PROCEDURE compras
	*********************************************************************************
	*-- Programa: COMPRAS.PRG
	*-- Fecha   : 07/01/91 10:55am
	*-- Version : BATA
	*-- Notas   : MENU SISTEMA DE VENTAS
	********************************************************************************
	=GETFUSER()
	=SETEOS()
	ulpr=PROGRAM()
	CLEA
	SET COLO TO W+
	@ 0,0,24,79 BOX REPL("°",9)
	SET COLO TO
	RELE PATH,pathpro,pathven,pathcaj,pathcpr
	PUBL PATH,pathpro,pathven,pathcaj,pathcpr
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
		REST FROM PATH ADDI
	ELSE
		IF FILE("F:\PUBLIC\pathCpr.MEM")
			REST FROM ("F:\PUBLIC\pathCpr") ADDI
		ELSE
			REST FROM \SISTEMAS\COMPRAS\COMPRASA\PATH ADDI
		ENDIF
	ENDIF
	*************************** INICIO comercializacion **************************
	@ 0,0 SAY REPLICATE("Û",80) COLO W
	@ 0,1 SAY PADC('Compras',20) COLO I
	@ 0,23 SAY '|'
	@ 0,25 SAY DATE() COLO I
	@ 0,34 SAY '|'
	@ 0,45 SAY '|'
	@ 0,58 SAY '|'
	SET SHAD ON
	@ 0,0 SAY REPLICATE("Û",80) COLO W
	@ 0,1 SAY PADC('Compras',20) COLO I
	@ 0,23 SAY '|'
	@ 0,25 SAY DATE() COLO I
	@ 0,34 SAY '|'
	@ 0,45 SAY '|'
	@ 0,58 SAY '|'
	SET SHAD ON
	DO genvar
	DO genvar1
	DO opaud
	DO opseg
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
	DO opdoc with 2
	ulpr=PROGRAM()
	=CABPAN1()
	=OPMAR()
	************************** inicio COMPRAS
	DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE COMPRAS' SHAD
	DEFI PAD varios OF main PROM '\<Varios'     AT 01,00 COLO SCHE 2
	DEFI PAD mercad OF main PROM '\<Mercader¡a' AT 01,07 COLO SCHE 2
	DEFI PAD provee OF main PROM '\<Proveed.'   AT 01,18 COLO SCHE 2
	DEFI PAD notpec OF main PROM '\<N. Pedido'  AT 01,27 COLO SCHE 2
	DEFI PAD remito OF main PROM '\<Remito'     AT 01,37 COLO SCHE 2
	DEFI PAD factur OF main PROM '\<Factura'    AT 01,44 COLO SCHE 2
	DEFI PAD ctacte OF main PROM '\<Cta Cte'    AT 01,52 COLO SCHE 2
	DEFI PAD variab OF main PROM 'V\<ariables'  AT 01,60 COLO SCHE 2
	DEFI PAD adios  OF main PROM 'C\<hau'       AT 01,70 COLO SCHE 2

	ON SELE PAD varios OF main ACTI POPU varios
	ON SELE PAD mercad OF main ACTI POPU mercad
	ON SELE PAD provee OF main ACTI POPU provee
	ON SELE PAD notpec OF main ACTI POPU notpec
	ON SELE PAD remito OF main ACTI POPU remito
	ON SELE PAD factur OF main ACTI POPU factur
	ON SELE PAD variab OF main ACTI POPU variab
	ON SELE PAD ctacte OF main ACTI POPU ctacte
	ON SELE PAD adios  OF main ACTI POPU adios

	respuesta='varios#2#0#A/B/M/L Varios#3#\<Bancos#\<Ciudades#Co\<ndiciones de Venta#'
	respuesta=respuesta+'\<I. V. A.#Imp\<utaci¢n#\<Marcas#\<Proveedores#Pr\<ovincias#\<Rubros'
	respuesta=respuesta+'#-#Control I\<mpresoras#-#Se\<guridad'
	=DEFPOP()
	*respuesta='mercad#2#7#A/B/M/L Mercader¡as#3#\<Mercader¡as#\<Precios #\<Stock#\<Kardex#\<Ingreso Mercader¡as'
	respuesta='mercad#2#7#A/B/M/L Mercader¡as#3#\<Mercader¡as#\<Precios #\<Stock#\<Ingreso Mercader¡as#\<Kardex'
	=DEFPOP()
	respuesta='provee#2#18#Gesti¢n de Proveedores#3#\<Datos Administrativos#\<Legajo del Proveedor'
	=DEFPOP()
	respuesta='notpec#2#27#Gesti¢n de Notas de Pedido de Compra#3#\<Ingreso#\<Agrega Mercader¡as#-'
	respuesta=respuesta+'#\<Modifica#-#Lista por \<Pantalla#Lista por Impresora#-#Restaura el Arc\<hivo'
	=DEFPOP()
	respuesta='remito#2#37#Gesti¢n de Remitos de Compra#3#Ingresa \<Remito#-#Listado por \<Pantalla#\<Listado por Impresora#-#Restaura \<Archivo'
	=DEFPOP()
	Respuesta='factur#2#44#Ingreso de Facturas#3#\<Factura de Proveedores#-#\<Borra Factura#-#Lista por \<Pantalla#Lista por \<Impresora#-#\<Corrige Numeraci¢n#Ci\<erra Mes de I.V.A.#-#Res\<taura el Archivo'
	=DEFPOP()
	respuesta='ctacte#2#27#Cuenta Corriente del Proveedor#3#\<Estado de Cuenta por Pantalla#Estado de Cuenta por \<Impresora#-#Notas de \<D‚bito#Notas de \<Cr‚dito'
	=DEFPOP()
	respuesta='variab#2#46#Mantenimiento de variables del sistema#3#\<Popups a Utilizar#Ancho de la \<Impresora#Ancho de la \<Hoja#'
	respuesta=respuesta+'\<Cantidad de D¡gitos#\<Denominaci¢n Moneda#\<N§ de Documentaci¢n#Orden Listados#C\<otizaci¢n del D¢lar'
	=DEFPOP()
	respuesta='adios#2#49#Se va del Sistema#3#ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»#º         \<Chau        º#ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼'
	=DEFPOP()
	ON SELE POPU varios DO varios
	ON SELE POPU mercad DO mercad
	ON SELE POPU provee DO provee
	ON SELE POPU notpec DO pec
	ON SELE POPU remito DO rec
	ON SELE POPU factur DO factur
	ON SELE POPU variab DO vari
	ON SELE POPU ctacte DO ctactep
	ON SELE POPU adios DO adios
	DO WHILE .T.
		ACTI MENU main
		IF USADOR="GOYO"
			EXIT
		ENDIF
	ENDDO
RETURN
