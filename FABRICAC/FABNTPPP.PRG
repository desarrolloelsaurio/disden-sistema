* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : FABNTPPP.PRG                                             �
* � COMENTARIO    : PROCESOS NO TERMINADOS - PROCESO POR PROCESO             �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-20-93                                                    �
* � HORA       : 00:45:57am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	CLEA
	STOR ONE TO PAG
	=CABPAN()
	=TIT_LIN(TWO,ELPRCTEX)
	SELE FAX
	SCAN
		IF ELPRC#PRC
			IF FABNTPP0(ONE,ELPRCTEX)
				EXIT
			ENDIF
		ENDIF
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO,ELPRCTEX)
		ENDIF
		=FABNTPP1()
	ENDSCAN
	=FIN_LIN(TWO,CASOSPARC,FABNTPP0(ONE,ELPRCTEX))
	=FIN_LIN(TWO,CASOS,FABNTPP2("TOTALES",TTTOT))
	=RELEWIN("WIN")
	=IAUD("")
	=REOPFAB()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
