* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LCORSEMP.PRG         �
* � COMENTARIO    :                      �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 08-20-93                �
* � HORA       : 00:45:57am              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS,TOTAL
	LINEA=REPL("=",LEN(ACLA))
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE TMP
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL,;
					PAIP+PADC("SUBTOTAL",10)+;
					PAIP+;
					SPACE(8)+;
					PAIP+;
					SPACE(8)+;
					PAIP+;
					SPACE(10)+;
					PAIP+;
					STR(M.TOTAL,XACDIGI)+;
					PAIP+;
					SPACE(30)+;
					PAIP)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		? LCORSEM0()
	ENDSCAN
	=FIN_LIN(TWO,CASOS,;
		PAIP+PADC("TOTAL",10)+;
		PAIP+;
		SPACE(8)+;
		PAIP+;
		SPACE(8)+;
		PAIP+;
		SPACE(10)+;
		PAIP+;
		STR(M.TOTAL,XACDIGI)+;
		PAIP+;
		SPACE(30)+;
		PAIP)
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
