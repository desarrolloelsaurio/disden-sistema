* 浜様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LRECBEP.PRG                  �
* � COMENTARIO    : LISTADO DE RECIBOS BANCARIOS �
* 麺様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                     �
* � FECHA      : 08-20-93                        �
* � HORA       : 00:45:57am                      �
* � COPYRIGHT  : 1993 by GREGORIO REINER         �
* 藩様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	=UNWORK()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE TMP
	STORE NUL TO T1,T2,T3
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL,;
				PADR("|SUBTOTAL",42)+;
				STR(T1,XACDIGI,2)+;
				PAIP+;
				STR(T2,XACDIGI,2)+;
				PAIP+;
				STR(T3,XACDIGI,2)+;
				PAIP)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		=LRECBE0()
	ENDSCAN
	=FIN_LIN(TWO,CASOS,;
	PADR("|TOTAL",42)+;
				STR(T1,XACDIGI,2)+;
				PAIP+;
				STR(T2,XACDIGI,2)+;
				PAIP+;
				STR(T3,XACDIGI,2)+;
				PAIP))
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
