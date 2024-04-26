* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INGDIARP.PRG                                             บ
* บ COMENTARIO    : LISTADO DE INGRESOS DIARIOS POR ORDEN DE REQUERIMIENTO   บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-20-93                                                    บ
* บ HORA       : 00:45:57am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=UNWORK()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE TMP
	GO TOP
	LAREF=TMP.REFERENCIA
	LAORD=VAL(SUBS(TMP.REFERENCIA,3))
	=XSEEK(LAORD,"REQ","NUMERO")
	VEZ=1
	SCAN
		IF LAREF#TMP.REFERENCIA
			? M.LINEA
			LAREF=TMP.REFERENCIA
			LAORD=VAL(SUBS(TMP.REFERENCIA,3))
			=XSEEK(LAORD,"REQ","NUMERO")
		ENDIF
		#IF "Win" $ vers()
		IF ROW()>(WROWS()-4)
		#ELSE
			IF ROW()>21
			#ENDIF
			IF !FIN_LIN(ONE,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		=INGDIAR0()
	ENDSCAN
	=FIN_LIN(TWO,CASOS)
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
