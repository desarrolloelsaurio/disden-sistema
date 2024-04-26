* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LTER1P.PRG                           บ
* บ COMENTARIO    : LISTA PRODUCCION TERMINADA POR RUBRO บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                             บ
* บ FECHA      : 08-20-93                                บ
* บ HORA       : 00:45:57am                              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                 บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE TMP
	GO TOP
	SCAN
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
		=LTER10()
	ENDSCAN
	=LTER10()
	=FIN_LIN(TWO,CASOS,;
	PAIP+;
	PADC("TOTALES",20)+;
	PAIP+;
	STR(TTER1,10)+;
	PAIP+;
	STR(TTER2,10)+;
	PAIP+;
	STR(TTER1+TTER2,10)+;
	PAIP+;
	STR(TTER2*100/(TTER1+TTER2),7,2))
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
