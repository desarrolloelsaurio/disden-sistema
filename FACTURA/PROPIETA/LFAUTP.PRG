* 浜様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LFAUTP.PRG                     �
* � COMENTARIO    : LISTA FACTURAS DE PROPIETARIOS �
* 麺様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                       �
* � FECHA      : 08-20-93                          �
* � HORA       : 00:45:57am                        �
* � COPYRIGHT  : 1993 by GREGORIO REINER           �
* 藩様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE CCP
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL,;
				PARSE("|SUBTOTAL",STR(M.TOTAUT,XACDIGI,2)+"|",LEN(ACLA)))
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		=LFAUTP0()
	ENDSCAN
	=FIN_LIN(TWO,CASOS,;
	PARSE("|TOTAL",STR(M.TOTAUT,XACDIGI,2)+"|",LEN(ACLA)))
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN 
