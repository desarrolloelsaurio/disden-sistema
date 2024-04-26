* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    : SISTEMA DE INMUEBLES                                     บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-22-93                                                    บ
* บ HORA       : 05:01:18pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE NADA.PRG
EXTERNAL PROCEDURE SHIT.PRG
SET TALK OFF
SET ESCA OFF
CLEA
=BIGCHARS(2,6,'INMUEBLES')
=BIGCHARS(15,17,'RAFULS',11)
ANTWIN=WONTOP()
ACTI SCRE
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
=INKEY(0,"HM")
ACTI WIND (ANTWIN)
DO WHILE !EMPTY(WONTOP())
	RELE WIND (WONTOP())
ENDDO
STORE .T. TO CONTROL
DO INMUEBL
RETURN

* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CONTRATO.PRG                                             บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 01-06-94                                                    บ
* บ HORA       : 11:20:10pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE INMUEBL
	#define PAIP "|"                               && PAIP
	=GETFUSER()
	=SETEOS()
	ULPR=PROGRAM()
	CLEA
	SET COLO TO W+
	@ 0,0,24,79 BOX REPL("ฐ",9)
	SET COLO TO
	CNTR=0
	COUNT=100
	LAST_NUM=0
	C=3
	=TER_SMOO(' Sistema de Gestiขn de Inmuebles ','Construyendo Menฃes','Espere por Favor')
	RELE PATH,PATHCAJ,PATHPRO,PATHVEN,PATHCOM,PATHCPR,PATHALQ,PATHCNS
	PUBL PATH,PATHCAJ,PATHPRO,PATHVEN,PATHCOM,PATHCPR,PATHALQ,PATHCNS
	=GETPATH()
	*************************** INICIO CAJA **************************
	=TER_SMO1(3)
	ACTI SCRE
	@ 0,0 SAY REPLICATE("Û",80) COLO W
	@ 0,1 SAY PADC('Gestiขn de Inmuebles',21) COLOR I
	@ 0,23 SAY PAIP
	@ 0,25 SAY DATE() COLOR I
	@ 0,34 SAY PAIP
	@ 0,36 SAY TIME() COLOR I
	@ 0,45 SAY PAIP
	@ 0,47 SAY PADC(PROGRAM(),10,' ') COLOR I
	@ 0,58 SAY PAIP
	ACTI WIND THERMO
	SET SHAD ON
	=GENVAR()
	=TER_SMO1(3)
	=GENVAR1()
	=TER_SMO1(3)
	ACTI SCRE
	=OPAUD()
	ACTI WIND THERMO
	=TER_SMO1(3)
	ACTI SCRE
	=OPSEG()
	ACTI WIND THERMO
	=TER_SMO1(3)
	ACTI SCRE
	=OPDOC()
	ACTI WIND THERMO
	=TER_SMO1(3)
	ULPR=PROGRAM()
	ACTI SCRE
	=CABPAN1()
	RELE WIND THERMO
	************************** INICIO CAJA
	DO WHILE .T.
		=CABPAN1()
		STORE .F. TO AFUTURO
		=OPCIU()
		DO OPINM
		DO OPPRP
		DO OPEST
		DO OPTIP
		SALIDA=POPMENU(6,23,'OPERACION A REALIZAR POR '+ALLTRIM(USADOR),;
		"DATOS ADMINISTRATIVOS",;
		"NUMEROS IMPOSITIVOS",;
		"LEGAJO",;
		"SALIDA DEL SISTEMA")
		DO CASE
		CASE SALIDA=1
			DO INM_DAT.SPR WITH .T.
		CASE SALIDA=2
			DO INM_IMP.SPR WITH .F.,.F.,.F.,.F.,.F.,.T.
		CASE SALIDA=3
			DO INM_LEG.SPR WITH .F.,.F.,.F.,.F.,.F.,.T.
		CASE SALIDA=4
			EXIT
		ENDCASE
	ENDDO
RETURN

PROCEDURE GENVAR
	=VAR_ACT()
	=TER_SMO1(3)
	=VAR_ALQ()
	=TER_SMO1(3)
	=VAR_CIU()
	=TER_SMO1(3)
	=VAR_DNI()
	=VAR_EST()
	=TER_SMO1(3)
	=VAR_GAR()
	=TER_SMO1(3)
	=VAR_GAS()
	=TER_SMO1(3)
	=VAR_IMP()
	=VAR_IVA()
	=TER_SMO1(3)
	=VAR_INM()
	=VAR_INQ()
	=TER_SMO1(3)
	=VAR_CLQ()
	=TER_SMO1(3)
	=VAR_PRP()
	=TER_SMO1(3)
	=VAR_PRV()
	=TER_SMO1(3)
	=VAR_IAC()
	=TER_SMO1(3)
	=VAR_TIP()
	=TER_SMO1(3)
	PUBL MARPOP,MARPOPR,MARPOPC
	PUBL MERPOP,MERPOPR,MERPOPC
	PUBL JANNAME,COEFSEG,USADOR,XACANCHO,XACHOJA,ACDIGI,XAUS,XAUSS,XACDIGI
	PUBL RH,RP,X10,X15,X20,X30,ORDCLI,ORDMER,ORDPRO,XADOL,XADOLS,XAMONEDA,XACOTIZ,XAREC_IMP
	PUBL XACDIGI

	=GETPOALQ()

	#UNDEFINE PAIP

	RELE SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMOD,SUCU,NUMIM,CART_INQUI,CART_PROPI,PROBE,PROBES,CANT_EMPRE,SSTM1,ABA
	PUBL SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMOD,SUCU,NUMIM,CART_INQUI,CART_PROPI,PROBE,PROBES,CANT_EMPRE,SSTM1,ABA

	RELE TEX_EFES,JANNRO,SSTM2,ENASCII
	PUBL TEX_EFES,JANNRO,SSTM2,ENASCII


	JANNRO=1
	TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
	CANT_EMPRE=1

	probe="Propietario"
	probes="Propietarios"

	sucu='0001'
	TECMOD="TECLA y [ENTER] modifica"
	botom='  '+repl('ฐ',78)
	PAIP='|'
	STOR 0 TO NUL,numim
	SSTM=padc('Gestiขn de Inmuebles',21)
	SSTM1="ADMIN"
	SSTM2='ALQUILER'
	ABA='Abriendo Base de '

	ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
	GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
	tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
	imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
	TEN='Existe - [ENTER] para Continuar'
	NLQ=CHR(27)+CHR(120)+CHR(1)+CHR(27)+CHR(107)+CHR(0)
	OFFNLQ=CHR(27)+CHR(120)+CHR(0)+CHR(18)
	UNDER=CHR(27)+CHR(45)+CHR(1)
	OFFUNDER=CHR(27)+CHR(45)+CHR(0)
	WIDE=CHR(27)+CHR(87)+CHR(1)
	OFFWIDE=CHR(27)+CHR(87)+CHR(0)
RETURN
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR1.PRG                                              บ
* บ COMENTARIO    : GENERA VARIABLES - SISTEMA DE ALQUILERES                 บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-22-93                                                    บ
* บ HORA       : 05:13:27pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE GENVAR1
	STORE 36 TO RH
	STORE 47 TO RP
	STORE REPL("!",10) TO X10
	STORE REPL("!",15) TO X15
	STORE REPL("!",20) TO X20
	STORE REPL("!",30) TO X30
	COEFSEG=1
	USADOR=GETENV("USERNAME")
	=GETGENE()
	STORE 'ADMINISTRACION RAFULS' TO JANNAME
	RELE PDS
	PUBL PDS[2]
	PDS[1]=132
	PDS[2]=233
	GENPED=.F.
	GENREM=.F.

	***** RESTAURA DATOS DE LA BASE MIXTA
	=OPMIX()
  XACDIGI=GETNU1(PADR("XACDIGI",20)+PADR(USADOR,10),"FOXPER")

	RELE HOJASUELTA
	PUBL HOJASUELTA
	STORE IIF(XSEEK(PADR("HOJASUELTA",LEN(MIX.TEXTO1))+PADR(GETENV("MAQUINA"),LEN(MIX.TEXTO2)),"MIX","FOXMAQ"),;
	(MIX.NU1=2),;
	.F.) TO M.HOJASUELTA
RETURN
