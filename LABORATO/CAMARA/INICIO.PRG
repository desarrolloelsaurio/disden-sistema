* VERSION CLINICA DE CAMARA GAMMA
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    : INICIO SISTEMA DE GESTION LABORATORIO ANALISIS           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:00:06pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE SHIT
EXTERNAL PROCEDURE NADA
EXTERNAL PROCEDURE PENDIENT

SET TALK OFF
SET ESCA OFF
CLEA
=GETFUSER()
=BIGCHARS(2,15,'CAMARA')
=BIGCHARS(7,18,'GAMMA',7)
=BIGCHARS(17,14,'G Reiner',13)
STORE 0 TO NUL
=MEN_LIN("TECLA PARA CONTINUAR")
=INKEY(0,'HM')
ON KEY LABEL ALT+F5 WAIT STR(_CUROBJ) WIND
DO WHILE !EMPTY(WONTOP())
	RELE WIND (WONTOP())
ENDDO
DO LABORATO
DO WHILE .T.
	ACTI MENU MAIN
	IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
		EXIT
	ENDIF
ENDDO
RETURN
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LABORATO.PRG                                             บ
* บ COMENTARIO    : GENERA MENUES PARA SISTEMA DE GESTION                    บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 01:02:35pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE LABORATO
	=SETEOS()
	CLEA
	SET COLO TO W+
	@ 0,0,24,79 BOX REPL("ฐ",9)
	SET COLO TO
	RELE PATH,PATHPRO,PATHVEN,PATHLAB
	PUBL PATH,PATHPRO,PATHVEN,PATHLAB

	=GETPATH()

	@ 0,0 SAY REPLICATE("Û",80) COLO W
	@ 0,1 SAY PADC('Laboratorio',20) COLO I
	@ 0,23 SAY '|'
	@ 0,25 SAY DATE() COLO I
	@ 0,34 SAY '|'
	@ 0,36 SAY TIME() COLO I
	@ 0,45 SAY '|'
	@ 0,47 SAY PADC("LABORATORIO",10) COLO I
	@ 0,58 SAY '|'
    =opmix()
	DO GENVAR
	DO GENVAR1
	DO OPAUD
	DO OPSEG
	=OPDOC()
	ULPR=PROGRAM()
	=IAUD("INGRESO AL SISTEMA")
	=CABPAN1()

	DEFI MENU MAIN MESSAGE 'MENU PRINCIPAL - SISTEMA DE GESTION DE LABORATORIO' SHAD COLO SCHE 2
	DEFI PAD VARIOS OF MAIN PROM '\<Varios'      AT 01,00 COLO SCHE 2
	DEFI PAD MUTUAL OF MAIN PROM '\<Mutuales'    AT 01,07 COLO SCHE 2
	DEFI PAD MEDICO OF MAIN PROM 'M\<dicos'     AT 01,16 COLO SCHE 2
	DEFI PAD PRACTI OF MAIN PROM '\<Pr cticas'   AT 01,24 COLO SCHE 2
	DEFI PAD PACIEN OF MAIN PROM 'Pa\<cientes'   AT 01,34 COLO SCHE 2
	DEFI PAD FACTUR OF MAIN PROM '\<Facturas'      AT 01,44 COLO SCHE 2
	DEFI PAD AGENDA OF MAIN PROM '\<Agenda'      AT 01,57 COLO SCHE 2
	DEFI PAD VARIAB OF MAIN PROM 'Varia\<bles'   AT 01,64 COLO SCHE 2
	DEFI PAD ADIOS  OF MAIN PROM 'C\<hau'        AT 01,74 COLO SCHE 2

	ON SELE PAD VARIOS OF MAIN ACTI POPU VARIOS
	ON SELE PAD MUTUAL OF MAIN ACTI POPU MUTUAL
	ON SELE PAD MEDICO OF MAIN ACTI POPU MEDICO
	ON SELE PAD PRACTI OF MAIN ACTI POPU PRACTI
	ON SELE PAD PACIEN OF MAIN ACTI POPU PACIEN
	ON SELE PAD FACTUR OF MAIN ACTI POPU FACTUR
	ON SELE PAD AGENDA OF MAIN ACTI POPU AGENDA
	ON SELE PAD VARIAB OF MAIN ACTI POPU VARIAB
	ON SELE PAD ADIOS  OF MAIN ACTI POPU ADIOS


	respuesta='varios#2#0#A/B/M/L Varios#3;
#\<Ciudades;
#C\<ondiciขn de I.V.A.;
#\<Provincias;
#\<Tipos de Documento;
#\<Unidades de Medida;
#-;
#Material \<Descartable;
#Material \<Radiactivo;
#\<Medicamentos;
#-;
#Contro\<l de Impresoras'
=defpop()

respuesta='mutual#2#7#Mutuales#3;
#\<Unidades;
#\<Tipos de Arancel;
#\<Aranceles;
#\<Tipos de Facturaciขn;
#-;
#\<Mutuales;
#\<Planes;
#P\<orcentajes;
#\<Legajo'
=defpop()

respuesta='medico#2#16#Mdicos#3;
#\<Especialidades;
#\<Sanatorios;
#-;
#\<Mdicos;
#\<Internos'
=defpop()

respuesta='PRACTI#2#24#Pr cticas#3;
#\<Grupo de Pr cticas;
#\<Tipo de Pr ctica;
#-;
#\<Pr cticas;
#\<Macropr cticas;
#-;
#\<Lista de Precios'
=defpop()


respuesta='PACIEN#2#34#Pacientes#3;
#\<Pacientes;
#P\<r cticas de Pacientes;
#\<Agrega Pr ctica;
#\<Cu ndo Vino ?'
=defpop()

respuesta='FACTUR#2#44#Facturaciขn#3;
#\<Listados de Control por Pantalla;
#Listados de Control por \<Impresora;
#-;
#Resumen por \<Pantalla;
#Resu\<men por Impresora;
#Emite \<Factura'

RESPUESTA=RESPUESTA+'#-;
#\<Cierra mes facturado;
#\<Reabre mes;
#Refactura \<Paciente;
#-;
#Reinde\<xa base'
=defpop()

respuesta='AGENDA#2#47#Agenda#3;
#\<Datos Generales;
#\<Legajo;
#\<Bฃsqueda'
=defpop()

respuesta='variab#2#50#Variables del Sistema#3;
#\<Ancho de la Impresora;
#Ancho de la \<Hoja;
#\<Cantidad de Dกgitos;
#\<Popups a Utilizar;
#\<Orden de los Listados;
#\<Porc. de Participaciขn;
#\<Porc. de Socios;
#\<Nฃmero de Paciente'
=defpop()

	respuesta='adios#2#53#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
	=DEFPOP()

	ON SELE POPU VARIOS DO VARIOS
	ON SELE POPU MUTUAL DO MUTUAL
	ON SELE POPU MEDICO DO MEDICO
	ON SELE POPU PRACTI DO PRACTI
	ON SELE POPU PACIEN DO PACIEN
	ON SELE POPU FACTUR DO FACTUR
	ON SELE POPU VARIAB DO VARIAB
	ON SELE POPU AGENDA DO AGE
	ON SELE POPU ADIOS DO ADIOS

	DO WHILE .T.
		ACTI MENU main
		IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
			EXIT
		ENDIF
	ENDDO
RETURN

* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR.PRG                                               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE GENVAR
    =VAR_AGE()
	=VAR_ARA()
	=VAR_IVA()
	=VAR_CIU()
	=VAR_DNI()
	=VAR_DES()
	=VAR_ESP()
	=VAR_GRU()
	=VAR_INTE()
	=VAR_MDD()
	=VAR_MED()
	=VAR_TFA()
	=VAR_TIP()
	=VAR_PAC()
	=VAR_PRA()
	=VAR_TAR()
	=VAR_MED()
	=VAR_MUT()
    =VAR_MUX()
	=VAR_RAD()
	=VAR_REM()
	=VAR_PRV()
	=VAR_SAN()
	=VAR_TPR()
	=VAR_UNI()
	PUBL maxciva,xaciva[15,7],xaci[3],xanum[3,12]
	PUBL abio,abios,tella,tellas,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor
	PUBL mader,maders,genped,genrem
	PUBL rh,rp,x10,X15,x20,x30,xadol,xadols,xamoneda,xacotiz
	PUBL xatalmin,xatalmax,xatalstep,xatalan,xRADs1,xRADs2,xRADs3,xRADs4
	PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis

	=GETPOLAB()

	RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,tecmen,SUCU,ENASCII,probe,probes,cant_empre,JANPOP,JANPOPR,JANPOPC,SSTM1
	PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,tecmen,SUCU,ENASCII,probe,probes,cant_empre,JANPOP,JANPOPR,JANPOPC,SSTM1
	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

	TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
	SSTM2="GESTION"
	ABA="Abriendo Base de "
	cant_empre=1
	probe="Proveedor"
	probes="Proveedores"

	PAIP='|'
	botom="  "+repl("ฐ",78)
	SSTM=padc('Pacientes',19)
	SSTM1="LABORATORIO"
	JANNAME='Clกnica de C mara Gamma'
	store 0 to nul

	ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
	GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
	TEN='Existe - [ENTER] para Continuar'
	TECMEN="[ENTER] para Menฃ"
	nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
	offnlq=chr(27)+chr(120)+chr(0)+chr(18)+chr(27)+chr(113)+chr(0)
	UNDER=CHR(27)+CHR(45)+CHR(1)
	OFFUNDER=CHR(27)+CHR(45)+CHR(0)
	WIDE=CHR(27)+CHR(87)+CHR(1)
	OFFWIDE=CHR(27)+CHR(87)+CHR(0)
RETURN

* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR1.PRG                                              บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE GENVAR1
	STORE 36 TO rh
	STORE 47 TO rp
	=GETGENE()
	coefseg=1
	usador=GETENV("USERNAME")
	rele pds
	PUBL pds[2]
	pds[1]=132
	pds[2]=233
    XACDIGI=GETNU1(PADR(USADOR,10)+PADR("XACDIGI",20),"FOXPER")
RETURN
