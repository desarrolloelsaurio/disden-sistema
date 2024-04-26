* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FABNTPPP.PRG                                             บ
* บ COMENTARIO    : PROCESOS NO TERMINADOS - PROCESO POR PROCESO             บ
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
