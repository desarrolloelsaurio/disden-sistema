*:*********************************************************************
SET TALK OFF
SET ESCA OFF
CLEA
=bigletT(2,1,'COMPRAS')
=bigchars(12,10,'NOVOGAR',7)
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
*!      Procedure: GENVAR
*!      Called by: COMPRAS        (procedure in INICIO.PRG)
*!   Memory Files: POSIC.MEM
*!*********************************************************************
PROCEDURE genvar
	=var_ali()
	=ter_smo1(2)
	=var_car()
	=VAR_BAN()
	=ter_smo1(2)
	=var_ciu()
	=ter_smo1(2)
	=var_cli()
	=ter_smo1(2)
	=var_col()
	=ter_smo1(2)
	=VAR_IVA()
	=var_gas()
	=ter_smo1(2)
	=var_gru()
	=ter_smo1(2)
	=var_lin()
	=ter_smo1(2)
	=var_mar()
	=ter_smo1(2)
	=var_mat()
	=ter_smo1(2)
	=var_pag()
	=ter_smo1(2)
	=var_pro()
	=ter_smo1(2)
	=var_prv()
	=ter_smo1(2)
	=var_rub()
	=ter_smo1(2)
	=var_opk()
	=ter_smo1(2)
	=var_tar()
	=ter_smo1(2)
	=var_via()
	=ter_smo1(2)
	=var_vix()
	=ter_smo1(2)
	=var_zon()
	=ter_smo1(2)
	=VAR_SER()
	=ter_smo1(2)
	PUBL iremc,iremr,ireman,iremla
	PUBL ifacc,ifacr,ifacan,ifacla
	PUBL merpop,merpopc,merpopr,merpop1
	PUBL merpop,merpopr,merpopc
	publ ipedr,ipedc,ipedan,ipedla
	PUBL Srupop,Srupopc,Srupopr
	PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
	PUBL janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor,JANNRO,XALARGO
	PUBL mader,maders,genped,genrem,biaja,biajas
	PUBL rh,rp,x10,x15,x20,x30,xadol,xadols,xamoneda,xacotiz
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis
	=ter_smo1(2)

	=GETPOCPR()
	RELE ORDALI,ORDCIU,ORDCLI,ORDCOL,ORDPAG,ORDGRU,ORDLIN,ORDMAR,ORDMER,ORDOPK,ORDPRO,ORDPRV,ORDRUB,ORDSRU,ORDZON,ORDGAS,JANPOP,JANPOPR,JANPOPC,ORDVIA
	PUBL ORDALI,ORDCIU,ORDCLI,ORDCOL,ORDPAG,ORDGRU,ORDLIN,ORDMAR,ORDMER,ORDOPK,ORDPRO,ORDPRV,ORDRUB,ORDSRU,ORDZON,ORDGAS,JANPOP,JANPOPR,JANPOPC,ORDVIA

	RELE sstm,ulpr,espere,grabando,tratando,imprimiendo,largoim,linea,largo,ten,nlq,offnlq,under,offunder,wide,offwide,nul,botom,paip,TECMEN,CANT_EMPRE,probe,probes,SSTM1
	PUBL sstm,ulpr,espere,grabando,tratando,imprimiendo,largoim,linea,largo,ten,nlq,offnlq,under,offunder,wide,offwide,nul,botom,paip,TECMEN,CANT_EMPRE,probe,probes,SSTM1
	RELE ABA,TEX_EFES,SSTM2,ENASCII,ESARROYO,SUCU
	PUBL ABA,TEX_EFES,SSTM2,ENASCII,ESARROYO,SUCU
	
RELE IVA09,IVA109,PC9,IVA18,IVA118,PC18,PC27,IVA127
PUBL IVA09,IVA109,PC9,IVA18,IVA118,PC18,PC27,IVA127

IVA09=10.5/100
IVA109=1+IVA09
PC9="10.5 %"
IVA18=21/100
IVA118=1+IVA18
PC18="21 %"
PC27="31.5 %"
IVA127=1.315

  TEX_EFES=" - [F2] Popup - [F3] B£squeda"
  SSTM2="COMPRAS"
	=ter_smo1(2)
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
	=GETJANNA()
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
	SET COLO TO
	STOR 0 TO cntr,last_num
	count=100
	c=3
	=ter_smoo(' Sistema de Compras ','Construyendo Men£es','Espere por Favor')
	RELE PATH,pathpro,pathven,pathcaj,pathcpr
	PUBL PATH,pathpro,pathven,pathcaj,pathcpr
	=GETPATH()
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
	acti wind thermo
	DO genvar
	=ter_SMO1(2)
	DO genvar1
	=ter_SMO1(2)
    ESARROYO=(GETENV("EQUIPO")='ARROYO')
	DO opaud
	=ter_SMO1(2)
	DO opseg
	=ter_SMO1(2)
	=opdoc()
	=OPMIX()
	=ter_SMO1(2)
	ulpr=PROGRAM()
	acti scre
	=CABPAN1()
	acti wind thermo
	************************** inicio COMPRAS
	DEFI MENU main MESSAGE 'MENU PRINCIPAL - SISTEMA DE COMPRAS' SHAD
	DEFI PAD varios OF main PROM '\<Varios'     AT 01,00 COLOR SCHE 2
	DEFI PAD mercad OF main PROM '\<Mercader¡a' AT 01,07 COLOR SCHE 2
	DEFI PAD provee OF main PROM '\<Proveed.'   AT 01,18 COLOR SCHE 2
	DEFI PAD requerim OF main PROM 'Re\<querim.'  AT 01,27 COLOR SCHE 2
	DEFI PAD remito OF main PROM '\<Remito'     AT 01,37 COLOR SCHE 2
	DEFI PAD factur OF main PROM '\<Factura'    AT 01,44 COLOR SCHE 2
	DEFI PAD ctacte OF main PROM '\<Cta Cte'    AT 01,52 COLOR SCHE 2
	DEFI PAD variab OF main PROM 'V\<ariables'  AT 01,60 COLOR SCHE 2
	DEFI PAD adios  OF main PROM 'C\<hau'       AT 01,70 COLOR SCHE 2
	=ter_SMO1(2)
	ON SELE PAD varios OF main ACTI POPU varios
	ON SELE PAD mercad OF main ACTI POPU mercad
	ON SELE PAD provee OF main ACTI POPU provee
	ON SELE PAD requerim OF main ACTI POPU requerim
	=ter_SMO1(2)
	ON SELE PAD remito OF main ACTI POPU remito
	ON SELE PAD factur OF main ACTI POPU factur
	ON SELE PAD variab OF main ACTI POPU variab
	ON SELE PAD ctacte OF main ACTI POPU ctacte
	ON SELE PAD adios  OF main ACTI POPU adios
	=ter_SMO1(2)
	respuesta='varios#2#0#A/B/M/L Varios#3;
#\<Alimentaci¢n;
#\<Bancos;
#\<Caracter¡sticas;
#Ci\<udades;
#C\<olores#'

respuesta=respuesta+;
'\<Grupos de Compra;
#\<I. V. A.;
#\<L¡neas;
#\<Marcas;
#\<Provincias;
#\<Rubros;
#\<Sub-Rubros;
#\<Tipo de Gasto;
#\<Zonas'
	respuesta=respuesta+'#-#Con\<trol de Impresoras'
	=DEFPOP()
	=ter_SMO1(3)
	respuesta='mercad#2#7#A/B/M/L Mercader¡as#3#\<Mercader¡as#\<Precios #\<Stock#\<Kardex#\<Consulta Precio'
	=DEFPOP()
	=ter_SMO1(3)
	respuesta='provee#2#18#Gesti¢n de Proveedores#3#\<Datos Administrativos#\<Legajo del Proveedor'
	=DEFPOP()
	=ter_SMO1(3)
	respuesta='requerim#2#27#Gesti¢n de Ordenes de Requerimiento#3;
#\<Cabecera;
#\<Mercader¡a;
#-;
#Listado por P\<antalla;
#Listado por \<Impresora;
#-;
#\<Pagos'
	=DEFPOP()
	=ter_SMO1(3)
respuesta='remito#2#37#Gesti¢n de Remitos de Compra#3;
#\<Recibe Remito;
#\<Legajo de Remito;
#-;
#Lista \<por Pantalla;
#Lista por \<Impresora;
#\<Mira un Remito;
#-;
#Reindex\<a'
=DEFPOP()

=ter_SMO1(3)
respuesta='factur#2#44#Gesti¢n de Facturas de Compra#3;
#\<Factura de Proveedores;
#-;
#\<Borra Factura;
#-#Lista por \<Pantalla;
#Lista por \<Impresora;
#-;
#\<Corrige Numeraci¢n;
#Ci\<erra Mes de I.V.A.;
#Re\<abre Mes de I.V.A.;
#-;
#Res\<taura el Archivo'
	=DEFPOP()
	=ter_SMO1(3)
	respuesta='ctacte#2#40#Cuenta Corriente del Proveedor#3;
#\<Estado de Cuenta;
#-;
#Notas de \<D‚bito;
#Notas de \<Cr‚dito;
#-;
#Ordenes de \<Pago;
#Cheques \<Emitidos'

	=DEFPOP()
	=ter_SMO1(3)
	respuesta='variab#2#50#Mantenimiento de variables del sistema#3;
#\<Popups a Utilizar;
#Ancho de la \<Impresora;
#Ancho de la \<Hoja;
#\<Largo de la Ho\<ja'
	respuesta=respuesta+';
#\<Cantidad de D¡gitos;
#\<Denominaci¢n Moneda;
#\<Orden Listados;
#P\<recios por Defecto;
#\<Stocks por Defecto'
	respuesta=respuesta+';
#D\<enominaci¢n Precios;
#N§ \<Lista de Precios;
#N§ Doc\<umentaci¢n;
#Selecci¢n \<Mercader¡a;
#Cotizaci¢n del Dolar'
	=DEFPOP()
	=ter_SMO1(3)
	respuesta='adios#2#49#Se va del Sistema#3#ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»#º         \<Chau        º#ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼'
	=DEFPOP()
	=ter_SMO1(3)
	ON SELE POPU varios DO varios
	ON SELE POPU mercad DO mercad
	ON SELE POPU provee DO pro
	=ter_SMO1(3)
	ON SELE POPU requerim DO requer
	ON SELE POPU remito DO rec
	ON SELE POPU factur DO factur
	=ter_SMO1(3)
	ON SELE POPU variab DO vari
	ON SELE POPU ctacte DO ctactep
	ON SELE POPU adios DO adios
	=ter_SMO1(3)
	rele cntr,count,last_num,segu,c
	=relewin("thermo")
    XACDIGI=GETNU1(PADR(USADOR,10)+PADR("XACDIGI",20),"FOXPER")
    XALARGO=GETNU1(PADR(USADOR,10)+PADR("XALARGO",20),"FOXPER")
	DO WHILE .T.
		ACTI MENU main
		IF GETENV("USERNAME")="GOYO"
			EXIT
		ENDIF
	ENDDO
RETURN
