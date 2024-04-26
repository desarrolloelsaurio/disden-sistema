****************************************************************************
*-- Programa: INICIO.PRG
*-- Fecha   : 08-14-92 05:07pm
*-- Version : G. REINER
*-- Notas   : INICIO SISTEMA DE CAJA
*             VERSION NOVOGAR
*             CAJA ARRIBA
********************************************************************************
EXTERNAL PROCEDURE SHIT
SET TALK OFF
SET ESCA OFF
CLEA
=bigletT(2,11,'CAJA')
=bigchars(12,10,'NOVOGAR',5)
store 0 to nul
=men_lin("TECLA PARA CONTINUAR")
=inkey(0,'HM')
do while !empty(wontop())
	rele wind (wontop())
enddo
DO cajaarri
DO WHILE .T.
	ACTI MENU main
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
		EXIT
	ENDIF
ENDDO
RETURN
PROCEDURE cajaarri
	*****************************************************************************
	*-- Programa: VENTAS.PRG
	*-- Fecha   : 07/01/91 10:55am
	*-- Version : G. REINER
	*-- Notas   : MENU SISTEMA DE CAJA - ADMONOSTRACION
	********************************************************************************
	=seteos()
	ulpr=PROGRAM()
	CLEA
	set color to W+
	@ 0,0,24,79 BOX REPL("°",9)
	set colo to
	STOR 0 TO cntr,last_num
	count=100
	c=3
	=ter_smoo(' Sistema de Caja ','Construyendo Men£es','Espere por Favor')
	RELE PATH,pathcaj,PATHPRO,PATHVEN,PATHCOM,pathcpr
	PUBL PATH,pathcaj,PATHPRO,PATHVEN,PATHCOM,pathcpr
    =GETPATH()
	*************************** INICIO comercializacion **************************
	=ter_SMO1(2)
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
	=MEN_CAJ()
	DO WHILE .T.
		ACTI MENU main
		IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .or. getenv("USERNAME")="GOYO"
			EXIT
		ENDIF
	ENDDO
	******************** FIN CAJA *************************************
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
	=VAR_BAN()
	=ter_SMO1(2)
	=VAR_CIU()
	=ter_SMO1(2)
	=VAR_CLI()
	=ter_SMO1(2)
	=VAR_COL()
	=ter_SMO1(2)
	=VAR_GAS()
	=ter_SMO1(2)
	=VAR_IVA()
	=VAR_LIN()
	=ter_SMO1(2)
	=VAR_GRU()
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
	=VAR_DNI()
	=ter_SMO1(2)
	=VAR_ZON()
	=ter_SMO1(2)
	=VAR_GNT()
	=VAR_GAR()
	publ ipedr,ipedc,ipedan,ipedla
	PUBL iremc,iremr,ireman,iremla
	PUBL ifacc,ifacr,ifacan,ifacla
	PUBL JANpop,JANpopr,JANpopc
	PUBL merpop,merpopr,merpopc
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor
	PUBL rh,rp,x10,X15,x20,x30,ordpro,xadol,xadols,xamoneda,xacotiz
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis,biaja,biajas
	PUBL JANNRO,JANNAME
	release ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
	public  ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
	rele ordciu,ordcli,ordMar,ordprv,ordpro,ordban
	publ ordciu,ordcli,ordMar,ordprv,ordpro,ordban
	stor .f. to ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli

	RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,nul,botom,paip,SUCU,JANNRO,cant_empre,probe,probes,sstm1
	PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,nul,botom,paip,SUCU,JANNRO,cant_empre,probe,probes,sstm1
	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

  TEX_EFES=" - [F2] Popup - [F3] B£squeda"

	ABA="Abriendo Base de "
	cant_empre=1
	probe="Proveedor"
	probes="Proveedores"
    =GETPOCAA()
    SSTM2="CAJAARRI"
	nul=0
	paip='|'
	botom='  '+repl("°",78)
	SSTM=padc('Caja',19)
	SSTM1="HOGAR"
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
	PAIP='|'
	cant_empre=1
	JANNRO=1
	botom="  "+repl(iif(iscolor(),'Û',"°"),78)
	store 0 to nul
	=GETJANNA()
	ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"°")
	GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"°")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"°")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°')
	TEN='Existe - [ENTER] para Continuar'
	TECMEN="[ENTER] para Men£"
	nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
	offnlq=chr(27)+chr(120)+chr(0)+chr(18)+chr(27)+chr(113)+chr(0)
	UNDER=CHR(27)+CHR(45)+CHR(1)
	OFFUNDER=CHR(27)+CHR(45)+CHR(0)
	WIDE=CHR(27)+CHR(87)+CHR(1)
	OFFWIDE=CHR(27)+CHR(87)+CHR(0)
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
	=GETGENE()
	coefseg=1
	usador=GETENV("USERNAME")
	rele pds
	PUBL pds[2]
	pds[1]=132
	pds[2]=233
	genped=.F.
	genrem=.F.
	BIAJA='Vendedor'
	BIAJAS='Vendedores'
	=OPMIX()
    XACDIGI=GETNU1(PADR(USADOR,10)+PADR("XACDIGI",20),"FOXPER")
RETURN
