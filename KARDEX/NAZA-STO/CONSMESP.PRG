* 浜様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : CONSMESP.PRG          �
* � COMENTARIO    : CONSUMOS MENSUALES    �
* 麺様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER              �
* � FECHA      : 08-20-93                 �
* � HORA       : 00:45:57am               �
* � COPYRIGHT  : 1993 by GREGORIO REINER  �
* 藩様様様様様様様様様様様様様様様様様様様�
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
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
