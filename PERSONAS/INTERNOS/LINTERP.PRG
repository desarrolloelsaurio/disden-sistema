* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LINTERP.PRG                                              �
* � COMENTARIO    : LISTADO DE INTERNOS                                      �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 07-28-94                                                    �
* � HORA       : 11:55:49am                                                  �
* � COPYRIGHT  : 1994 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
	SELE LIQ
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		=LINTER1()
	ENDSCAN
	=FIN_LIN(TWO,CASOS)
	=RELEWIN("WIN")
	=IAUD(PER.CODCLI)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
