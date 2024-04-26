* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CONSMESP.PRG          บ
* บ COMENTARIO    : CONSUMOS MENSUALES    บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 08-20-93                 บ
* บ HORA       : 00:45:57am               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	SELE TMP
	=UNWORK()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE TMP
	GO TOP
	ELART=EVAL(ART)
	DIME MESES[12]
	STORE NUL TO MESES
	SCAN
		=CONSMES0()
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
		STORE MESES[MONTH(TMP.FECHAOP)]+TMP.SALIDA TO MESES[MONTH(TMP.FECHAOP)]
	ENDSCAN
	=CONSMES0()
	=FIN_LIN(TWO,CASOS)
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
