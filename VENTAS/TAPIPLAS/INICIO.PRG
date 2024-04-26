*:*********************************************************************
*: VERSION TAPIPLAST
*:*********************************************************************
*:
*:        Program: INICIO.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/26/91     11:36
*:
*:*********************************************************************
SET TALK OFF
SET ESCA OFF
=GETFUSER()
CLEA
=bigletT(2,1,'PRECIOS')
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
	PUBL cagpop,icagr,icagc,icagla,icagan,ccagc,ccagr,ccagan,ccagla,cagpopc,cagpopr,vcagc,vcagr,vcagan,vcagla,mcagc,mcagr,mcagla,mcagan
	PUBL ciupop,iciur,iciuc,iciula,iciuan,cciuc,cciur,cciuan,cciula,ciupopc,ciupopr,vciuc,vciur,vciuan,vciula,mciuc,mciur,mciula,mciuan
	PUBL clipop,iclir,iclic,iclila,iclian,cclic,cclir,cclian,cclila,clipopc,clipopr,vclic,vclir,vclian,vclila,mclic,mclir,mclila,mclian
	PUBL colpop,icolr,icolc,icolla,icolan,ccolc,ccolr,ccolan,ccolla,colpopc,colpopr,vcolc,vcolr,vcolan,vcolla,mcolc,mcolr,mcolla,mcolan
	PUBL curpop,icurc,icurr,icuran,icurla,curpopc,curpopr
	PUBL iremc,iremr,ireman,iremla
	PUBL ifacc,ifacr,ifacan,ifacla
	PUBL grupop,igruc,igrur,igrula,igruan,cgruc,cgrur,cgrula,cgruan,grupopc,grupopr,vgruc,vgrur,vgruan,vgrula,mgruc,mgrur,mgrula,mgruan
	PUBL linpop,ilinc,ilinr,ilinla,ilinan,clinr,clinc,clinan,clinla,linpopc,linpopr,vlinan,vlinla,vlinr,vlinc,mlinr,mlinc,mlinan,mlinla
	PUBL matpop,imatc,imatr,imatan,imatla,cmatc,cmatr,cmatan,cmatla,matpopc,matpopr,mmatc,mmatr,mmatan,mmatla,vmatr,vmatc,vmatla,vmatan
	PUBL merpop,imerc,imerr,imeran,imerla,cmerc,cmerr,cmeran,cmerla,merpopc,merpopr,mmerc,mmerr,mmeran,mmerla,vmerr,vmerc,vmerla,vmeran,merpop1
	PUBL pagpop,ipagr,ipagc,ipagla,ipagan,cpagc,cpagr,cpagan,cpagla,pagpopc,pagpopr,vpagc,vpagr,vpagan,vpagla,mpagr,mpagc,mpagla,mpagan
	PUBL propop,ipror,iproc,iprola,iproan,cproc,cpror,cproan,cprola,propopc,propopr,vproc,vpror,vproan,vprola,mproc,mpror,mprola,mproan
	publ ipedr,ipedc,ipedan,ipedla
	PUBL PAIpop,iPAIr,iPAIc,iPAIla,iPAIan,cPAIc,cPAIr,cPAIan,cPAIla,PAIpopc,PAIpopr,vPAIc,vPAIr,vPAIan,vPAIla,mPAIc,mPAIr,mPAIla,mPAIan
	PUBL prvpop,iprvr,iprvc,iprvla,iprvan,cprvc,cprvr,cprvan,cprvla,prvpopc,prvpopr,vprvc,vprvr,vprvan,vprvla,mprvc,mprvr,mprvla,mprvan
	PUBL rubpop,irubc,irubr,iruban,irubla,crubc,crubr,cruban,crubla,rubpopc,rubpopr,vrubc,vrubr,vruban,vrubla,mrubr,mrubc,mruban,mrubla
	PUBL srupop,isruc,isrur,isruan,isrula,csruc,csrur,csruan,csrula,srupopc,srupopr,vsruc,vsrur,vsruan,vsrula,msrur,msruc,msruan,msrula
	PUBL opkpop,iopkr,iopkc,iopkan,iopkla,copkr,copkc,copkla,copkan,opkpopr,opkpopc,mopkc,mopkr,mopkan,mopkla,vopkr,vopkc,vopkan,vopkla
	PUBL MARpop,iMARr,iMARc,iMARla,iMARan,cMARc,cMARr,cMARan,cMARla,MARpopc,MARpopr,vMARc,vMARr,vMARan,vMARla,mMARc,mMARr,mMARla,mMARan
	PUBL tarpop,itarr,itarc,itarla,itaran,ctarc,ctarr,ctaran,ctarla,tarpopc,tarpopr,vtarc,vtarr,vtaran,vtarla,mtarc,mtarr,mtarla,mtaran
	PUBL JANPop,JANpopr,JANpopc
	PUBL merpop,merpopr,merpopc
	PUBL ivixr,ivixc,ivixla,ivixan,cvixc,cvixr,cvixan,cvixla,vvixc,vvixr,vvixan,vvixla,mvixc,mvixr,mvixla,mvixan
	PUBL zonpop,izonr,izonc,izonla,izonan,czonc,czonr,czonan,czonla,zonpopc,zonpopr,vzonc,vzonr,vzonan,vzonla,mzonc,mzonr,mzonla,mzonan
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL abio,abios,tella,tellas,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor,JANNRO
	PUBL rh,rp,x10,X15,x20,x30,xadol,xadols,xamoneda,xacotiz
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis,XAIVA1,XAIVA2,XAIVA3,XAIVA4
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .or. GETENV("EQUIPO")="MICASA"
		REST FROM posic ADDI
	ELSE
		IF GETENV("EQUIPO")="TAPIPLAST"
			REST FROM C:\SISTEMAS\VENTAS\VENTASP\POSIC ADDI
		ELSE
			REST FROM ('F:\usr\'+getenv("username")+"\posicCOM") ADDI
		ENDIF
	ENDIF

	rele ORDCIU,ORDcol,ORDcag,ORDGRU,ORDLIN,ORDmar,ORDmat,ORDMER,ORDpai,ORDPRo,ORDrub,ORDSru
	publ ORDCIU,ORDcol,ORDcag,ORDGRU,ORDLIN,ORDmar,ORDmat,ORDMER,ORDpai,ORDPRo,ORDrub,ORDSru
	store .t. to ORDCIU,ORDcol,ORDcag,ORDGRU,ORDLIN,ORDmar,ORDmat,ORDMER,ORDpai,ORDPRo,ORDrub,ORDSru

	RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,BIAJA,BIAjas,ENASCII,CANT_EMPRE,probe,probes,mader,maders,SSTM1
	PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,biaja,biajas,ENASCII,CANT_EMPRE,probe,probes,mader,maders,SSTM1

	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

  TEX_EFES=" - [F2] Popup - [F3] B£squeda"
  SSTM2="PRECIOS"
ABA="Abriendo Base de "

	probe="Proveedor"
	probes="Proveedores"

	mader='Material'
	maders='Materiales'

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
	SSTM=padc('Precios',19)
	SSTM1="VARIOS"
	ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"°")
	GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"°")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"°")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°')
	TEN='Existe - [ENTER] para Continuar'
	JANNAME='TAPIPLAST S.R.L.'
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
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
		REST FROM (PATH+'\GENE') ADDI
	ELSE
		IF GETENV("EQUIPO")="MICASA"
			REST FROM GENE ADDI
		ELSE
			REST FROM (PATH+'\GENE') ADDI
		ENDIF
	ENDIF
	STORE 'Rubro' TO ruvro
	STORE 'Rubros' TO ruvros
	rele pds
	PUBL pds[2]
	pds[1]=132
	pds[2]=233
	store .f. to genped,genrem
RETURN .t.
*********************************************************************************
*-- Programa: VENTAS.PRG
*-- Fecha   : 07/01/91 10:55am
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE VENTAS
********************************************************************************
procedure VENTAS
	=SETEOS()
	ulpr=PROGRAM()
	if !iscolor()
		CLEA
		set colo to w+
		@ 0,0,24,79 BOX REPL("°",9)
		set colo to
	endif
	RELE COEFSEG,USN,USER_NO
	PUBL COEFSEG,USN,USADOR,USER_NO
	IF FILE("F:\PUBLIC\MONDAY.PAS")
		COEFSEG=SEGURI1()
		usador=GETENV("USERNAME")
	ELSE
		COEFSEG=SEGURIC()
		usador=USN
	ENDIF
	IF EMPTY(COEFSEG)
		QUIT
	ENDIF

	store 0 to cntr,last_num
	count=100
	c=3
	=ter_smoo('Sistema de Comercializaci¢n','Construyendo Men£es','Espere por Favor')
	set colo to
	RELE PATH,pathpro,PATHVEN,PATHCOM
	PUBL PATH,pathpro,PATHVEN,PATHCOM
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .or. GETENV("EQUIPO")="MICASA"
		IF FILE("f:\SISTEMAS\ventas\ventasa\path.MEM")
			REST FROM f:\SISTEMAS\ventas\ventasa\path ADDI
		ELSE
			REST FROM path ADDI
		ENDIF
	ELSE
		IF GETENV("EQUIPO")="TAPIPLAST"
			REST FROM C:\SISTEMAS\VENTAS\VENTASA\PATH ADDI
		ELSE
			REST FROM ("F:\PUBLIC\pathCOM") ADDI
		ENDIF
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
	do opaud
	acti wind thermo
	=ter_smo1(3)
	acti scre
	do opseg
	acti wind thermo
	=ter_smo1(3)
	do OPDOC WITH 2
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
	=ter_smo1(6)
	************************** inicio comercializacion
	DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE VENTAS' shad COLO SCHE 2
	DEFI PAD varios OF main PROM '\<Varios'      AT 01,00 COLO SCHE 2
	DEFI PAD provee OF main PROM '\<Proveedores' AT 01,14 COLO SCHE 2
	=ter_smo1(6)
	DEFI PAD mercad OF main PROM '\<Mercader¡a' AT 01,29 COLO SCHE 2
	DEFI PAD poligo OF main PROM 'Poli\<gonal'  AT 01,44 COLO SCHE 2
	DEFI PAD variab OF main PROM 'V\<ariables'  AT 01,60 COLO SCHE 2
	=ter_smo1(6)
	DEFI PAD adios  OF main PROM 'C\<hau'       AT 01,75 COLO SCHE 2
	ON sele PAD varios OF main ACTI popu varios
	ON sele PAD provee OF main ACTI popu provee
	ON sele PAD mercad OF main ACTI popu mercad
	ON sele PAD poligo OF main ACTI popu poligo
	ON sele PAD variab OF main ACTI popu variab
	ON sele PAD adios  OF main ACTI popu adios
	=ter_smo1(6)
	respuesta='varios#2#0#A/B/M/L Varios#3#\<Ciudades#Color\<es#Co\<nceptos de Agrupaci¢n#\<Grupos de Compra#\<I. V. A.#\<L¡neas#\<Marcas#M\<ateriales#\<Pa¡ses#Pro\<vincias#\<Rubros#\<Sub-Rubros#-#Cam\<bio Contrase¤a'
	=defpop()
	=ter_smo1(6)
	respuesta='provee#2#14#Gesti¢n de Proveedores#3#\<Datos Administrativos#\<Legajo del Proveedor'
	=DEFPOP()
	=ter_smo1(6)
	respuesta='mercad#2#29#A/B/M/L Mercader¡as#3#\<Mercader¡as#\<Costos#\<Precios #\<Stock#\<Legajo'
	=DEFPOP()
	=ter_smo1(3)
	respuesta='poligo#2#44#A/B/M/L Poligonales#3#\<Ingreso - Correcci¢n#-#Listado por \<Pantalla#\<Listado por Impresora#-#\<Restaura el Archivo'
	=DEFPOP()
	=ter_smo1(6)
	respuesta='variab#2#55#Mantenimiento de variables del sistema#3#\<Popups a Utilizar#Ancho de la \<Impresora#Ancho de la \<Hoja#'
	respuesta=respuesta+'\<Cantidad de D¡gitos#Coti\<zaci¢n '+xadol+'#\<Denominaci¢n Moneda#\<Orden Listados'
	respuesta=respuesta+'#D\<enominaci¢n Precios#I\<VA por Defecto#N§ \<Lista de Precios#P\<recios por Defecto#Selecci¢n \<Mercader¡a'
	=ter_smo1(6)
	=DEFPOP()
	=ter_smo1(6)
	respuesta='adios#2#70#Se va del Sistema#3#ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»#º         \<Chau        º#ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼'
	=ter_smo1(6)
	=DEFPOP()
	=ter_smo1(6)
	ON SELE popu varios DO varios
	ON SELE popu mercad DO mercad
	ON SELE popu provee DO provee with 4,25
	ON SELE popu poligo DO poligo
	ON SELE popu variab DO vari
	ON SELE popu adios DO adios
	=ter_smo1(6)
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
