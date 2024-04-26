*:*********************************************************************
SET TALK OFF
SET ESCA OFF
CLEA
=bigletT(2,1,'COMPRAS')
=bigchars(12,25,'NASA',7)
store 0 to nul
=men_lin("TECLA PARA CONTINUAR")
=inkey(0,'HM')
do while !empty(wontop())
	rele wind (wontop())
enddo
DO compras
DO WHILE .T.
	ACTI MENU main
	IF GETENV("USERNAME")="GOYO"
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
	=VAR_AVI()
	PUBL CORPOP,CORPOPR,CORPOPC
	PUBL CURPOP,ICURC,ICURR,ICURAN,ICURLA,CURPOPC,CURPOPR
	=VAR_CIU()
	=VAR_GRU()
	=TER_SMO1(2)
	=VAR_LIN()
	=VAR_MAT()
	=VAR_MER()
	=TER_SMO1(2)
	=VAR_OPK()
	PUBL PRCPOP,IPRCR,IPRCC,IPRCAN,IPRCLA,CPRCR,CPRCC,CPRCAN,CPRCLA,PRCPOPC,PRCPOPR,VPRCR,VPRCC,VPRCAN,VPRCLA,MPRCC,MPRCR,MPRCAN,MPRCLA
	=VAR_PRO()
	=TER_SMO1(2)
	=VAR_RUB()
	PUBL SUEPOP,ISUEC,ISUER,ISUELA,ISUEAN,CSUEC,CSUER,CSUELA,CSUEAN,SUEPOPC,SUEPOPR,VSUEC,VSUER,VSUEAN,VSUELA,MSUEC,MSUER,MSUELA,MSUEAN
	=TER_SMO1(2)
	=VAR_TAL()
	PUBL TELPOP,ITELC,ITELR,ITELLA,ITELAN,CTELC,CTELAN,CTELR,CTELLA,TELPOPC,TELPOPR,MTELR,MTELC,MTELAN,MTELLA,VTELR,VTELC,VTELAN,VTELLA
	PUBL IDESC,IDESR,IDESLA,IDESAN,CDESC,CDESR,CDESLA,CDESAN,MDESR,MDESC,MDESAN,MDESLA
	=TER_SMO1(2)
	PUBL IRUTR,IRUTC,IRUTLA,IRUTAN,CRUTR,CRUTC,CRUTAN,CRUTLA,MRUTR,MRUTC,MRUTAN,MRUTLA
	PUBL IFABR,IFABC,IFABLA,IFABAN,CFABC,CFABR,CFABAN,CFABLA,MFABC,MFABR,MFABAN,MFABLA
	PUBL MARPOP,MARPOPR,MARPOPC
	=TER_SMO1(2)
	PUBL IKARR,IKARC,IKARAN,IKARLA,MKARR,MKARC,MKARAN,MKARLA,VKARR,VKARC,VKARAN,VKARLA

	RELE ORDMER,ORDAVI,ORDTEL,ORDPRO,ORDSUE,ORDRUB,ORDLIN,ORDTAL,ORDGRU,ORDPRC,ORDOPK
	=TER_SMO1(2)
    PUBL ORDMER,ORDAVI,ORDTEL,ORDPRO,ORDSUE,ORDRUB,ORDLIN,ORDTAL,ORDGRU,ORDPRC,ORDOPK

	RELE ABIO,ABIOS,TELLA,TELLAS,XAUS,XAUSS,ZUELA,ZUELAS,RUVRO,RUVROS,LLINEA,LLINEAS,JANNAME,COEFSEG,USADOR,XACANCHO,XACHOJA,ACDIGI,XAUS,XAUSS,XACDIGI,KORTE,XANUMCOR
	RELE MADER,MADERS,XATALMAX,XATALMIN,XATALSTEP

	PUBL ABIO,ABIOS,TELLA,TELLAS,XAUS,XAUSS,ZUELA,ZUELAS,RUVRO,RUVROS,LLINEA,LLINEAS,JANNAME,COEFSEG,USADOR,XACANCHO,XACHOJA,ACDIGI,XAUS,XAUSS,XACDIGI,KORTE,XANUMCOR
	PUBL MADER,MADERS,XATALMAX,XATALMIN,XATALSTEP

	PUBL iremc,iremr,ireman,iremla
	PUBL ifacc,ifacr,ifacan,ifacla
	PUBL merpop,merpopc,merpopr,merpop1
	PUBL merpop,merpopr,merpopc
	publ ipedr,ipedc,ipedan,ipedla
	PUBL Srupop,Srupopc,Srupopr
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor,JANNRO
	PUBL mader,maders,genped,genrem,biaja,biajas
	PUBL rh,rp,x10,x15,x20,x30,xadol,xadols,xamoneda,xacotiz
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis
	=ter_smo1(2)
    =GETPATH()
	=GETPOCPR()
	RELE ORDALI,ORDCIU,ORDCLI,ORDCOL,ORDPAG,ORDGRU,ORDLIN,ORDMAR,ORDMER,ORDOPK,ORDPRO,ORDPRV,ORDRUB,ORDSRU,ORDZON,ORDGAS,JANPOP,JANPOPR,JANPOPC,ORDVIA
	PUBL ORDALI,ORDCIU,ORDCLI,ORDCOL,ORDPAG,ORDGRU,ORDLIN,ORDMAR,ORDMER,ORDOPK,ORDPRO,ORDPRV,ORDRUB,ORDSRU,ORDZON,ORDGAS,JANPOP,JANPOPR,JANPOPC,ORDVIA

	RELE sstm,ulpr,espere,grabando,tratando,imprimiendo,largoim,linea,largo,ten,nlq,offnlq,under,offunder,wide,offwide,nul,botom,paip,TECMEN,CANT_EMPRE,probe,probes,SSTM1
	PUBL sstm,ulpr,espere,grabando,tratando,imprimiendo,largoim,linea,largo,ten,nlq,offnlq,under,offunder,wide,offwide,nul,botom,paip,TECMEN,CANT_EMPRE,probe,probes,SSTM1
	RELE ABA,TEX_EFES,SSTM2,ENASCII,ESARROYO
	PUBL ABA,TEX_EFES,SSTM2,ENASCII,ESARROYO

  TEX_EFES=" - [F2] Popup - [F3] B£squeda"
  SSTM2="COMPRAS"
	=ter_smo1(2)
		STOR 'Accesorio' TO abio
	STOR 'Accesorios' TO abios
	STOR 'Material' TO tella
	STOR 'Materiales' TO tellas
	=ter_SMO1(2)
	STOR 'Austral' TO xaus
	STOR 'Australes' TO xauss
	STOR 'Color' TO zuela
	STOR 'Colores' TO zuelas
	STOR 'Rubro' TO ruvro
	STOR 'Rubros' TO ruvros
	=ter_SMO1(2)
	STOR 'L¡nea' TO llinea
	STOR 'L¡neas' TO llineas
	STOR 'Fabricaci¢n' TO favri
	STOR 'Corte' TO korte
	STOR 'Molder¡a' to mader
	STOR 'Molder¡a' to maders
	ABA="Abriendo Base de "
	probe="Proveedor"
	probes="Proveedores"
	STORE 1 TO CANT_EMPRE
	paip='|'
	botom="  "+REPL("°",78)
	STORE 0 TO nul
	sstm=PADC('Compras',19)
	SSTM1="HOGAR"
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
	=GETGENE()
	STORE 'Rubro' TO ruvro
	STORE 'Rubros' TO ruvros
	STORE 'L¡nea' TO llinea
	STORE 'L¡neas' TO llineas
	STORE 1 TO JANNRO
	JANNAME=CHR(67)+CHR(111)+CHR(109)+CHR(112)+CHR(97)+CHR(164)+CHR(161)+CHR(97)+CHR(32)+CHR(100)+CHR(101)+CHR(32)+CHR(80)+CHR(114)+CHR(111)+CHR(100)+CHR(117)+CHR(99)+CHR(116)+CHR(111)+CHR(115)+CHR(32)+CHR(78)+CHR(65)+CHR(90)+CHR(65)+CHR(32)+CHR(83)+CHR(82)+CHR(76)
	SUCU='0005'
	STORE 'Corte' TO korte
	STORE 'Molder¡a' TO mader
	STORE 'Molder¡a' TO maders
	STORE "Viajante" TO biaja
	STORE "Viajantes" TO biajas
	coefseg=1
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
	EXTERNAL PROCEDURE IM_LIN.PRG
	=SETEOS()
	=GETFUSER()
	CLEA
	ulpr=PROGRAM()
	SET COLO TO W+
	@ 0,0,24,79 BOX REPL("°",9)
	SET COLO TO
	STOR 0 TO cntr,last_num
	count=100
	c=3
	=ter_smoo(' Sistema de Compras ','Construyendo Men£es','Espere por Favor')
	RELE PATH,pathpro,pathven,pathcaj,pathcpr
	PUBL PATH,pathpro,pathven,pathcaj,pathcpr
	=GETLIB()
	*************************** INICIO comercializacion **************************
	=ter_SMO1(2)
	acti scre
	@ 0,0 SAY REPLICATE("Û",80) COLO W
	@ 0,1 SAY PADC('Compras',20) COLO I
	@ 0,23 SAY '|'
	@ 0,25 SAY DATE() COLO I
	@ 0,34 SAY '|'
	@ 0,45 SAY '|'
	@ 0,58 SAY '|'
	SET SHAD ON
	ACTI WIND THERMO
	DO GENVAR
	=TER_SMO1(2)
	DO GENVAR1
	=TER_SMO1(2)
	DO OPAUD
	=TER_SMO1(2)
	DO OPSEG
	=TER_SMO1(2)
	DO OPDOC
	=TER_SMO1(2)
	ULPR=PROGRAM()
	ACTI SCRE
	=CABPAN1()
	ACTI WIND THERMO
	************************** inicio COMPRAS
	DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE COMPRAS' SHAD
	DEFI PAD varios OF main PROM '\<Varios'     AT 01,00 COLOR SCHE 2
	DEFI PAD mercad OF main PROM '\<Mercader¡a' AT 01,07 COLOR SCHE 2
	DEFI PAD provee OF main PROM '\<Proveed.'   AT 01,18 COLOR SCHE 2
	DEFI PAD notpec OF main PROM '\<N. Pedido'  AT 01,27 COLOR SCHE 2
	DEFI PAD remito OF main PROM '\<Remito'     AT 01,37 COLOR SCHE 2
	DEFI PAD factur OF main PROM '\<Factura'    AT 01,44 COLOR SCHE 2
	DEFI PAD ctacte OF main PROM '\<Cta Cte'    AT 01,52 COLOR SCHE 2
	DEFI PAD variab OF main PROM 'V\<ariables'  AT 01,60 COLOR SCHE 2
	DEFI PAD adios  OF main PROM 'C\<hau'       AT 01,70 COLOR SCHE 2
	=TER_SMO1(2)
	ON SELE PAD VARIOS OF MAIN ACTI POPU VARIOS
	ON SELE PAD MERCAD OF MAIN ACTI POPU MERCAD
	ON SELE PAD PROVEE OF MAIN ACTI POPU PROVEE
	ON SELE PAD NOTPEC OF MAIN ACTI POPU NOTPEC
	=TER_SMO1(2)
	ON SELE PAD REMITO OF MAIN ACTI POPU REMITO
	ON SELE PAD FACTUR OF MAIN ACTI POPU FACTUR
	ON SELE PAD VARIAB OF MAIN ACTI POPU VARIAB
	ON SELE PAD CTACTE OF MAIN ACTI POPU CTACTE
	ON SELE PAD ADIOS  OF MAIN ACTI POPU ADIOS
	=TER_SMO1(2)
		RESPUESTA='varios#2#0#A/B/M/L Varios#3;
#\<Rubros;
#\<Subrubros;
#\<Talleres y Dep¢sitos;
#\<Grupos de Compra;
#Procesos de \<Fabricaci¢n'
RESPUESTA=RESPUESTA+';
#\<Curvas;
#\<Unidades;
#-;
#Control I\<mpresoras;
#Env¡a Mensa\<je'
	=TER_SMO1(2)
	=DEFPOP()

	respuesta='mercad#2#7#A/B/M/L Mercader¡as#3;
#\<Mercader¡as;
#\<Precios;
#-#\<'+;
ABIOS+"#\<"+;
TELLAS
	=DEFPOP()
	=TER_SMO1(3)

	respuesta='PROVEE#2#18#Gesti¢n de '+probes+'#3;
#Datos Administrativos;
#Legajo'
	=DEFPOP()
	=TER_SMO1(3)

	respuesta='variab#2#50#Mantenimiento de variables del sistema#3#\<Popups a Utilizar;
#Ancho de la \<Impresora;
#Ancho de la \<Hoja'

respuesta=respuesta+';
#\<Cantidad de D¡gitos;
#\<Denominaci¢n Moneda;
#\<Orden Listados#;
P\<recios por Defecto;
#\<Stocks por Defecto'

respuesta=respuesta+';
#D\<enominaci¢n Precios;
#N§ \<Lista de Precios#;
N§ Doc\<umentaci¢n;
#Selecci¢n \<Mercader¡a;
#Cotizaci¢n del Dolar'
	=DEFPOP()
	=TER_SMO1(3)

	respuesta='adios#2#49#Se va del Sistema#3#ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»#º         \<Chau        º#ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼'
	=DEFPOP()
	=TER_SMO1(3)
	ON SELE POPU varios DO varios
	ON SELE POPU mercad DO mercad
	ON SELE POPU provee DO pro
	ON SELE POPU adios DO adios
	=TER_SMO1(3)
	RELE CNTR,COUNT,LAST_NUM,SEGU,C
	=RELEWIN("THERMO")

	DO WHILE .T.
		ACTI MENU main
		IF GETENV("USERNAME")="GOYO"
			EXIT
		ENDIF
	ENDDO
RETURN
