* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARFP.PRG                                               บ
* บ COMENTARIO    : STOCK A FECHA POR IMPRESORA                              บ
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
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE KAR
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL,PARSE("|SUBTOTAL",STR(M.ELTOT,XACDIGI,2)+PAIP,LEN(ACLA)))
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		=LKARFP1()
	ENDSCAN
	=FIN_LIN(TWO,CASOS,PARSE("|SUBTOTAL",STR(M.ELTOT,XACDIGI,2)+PAIP,LEN(ACLA)))
	=RELEWIN("WIN")
	=IAUD(DTOC(M.FECINI))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
