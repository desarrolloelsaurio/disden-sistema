* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCBP.PRG                            บ
* บ COMENTARIO    : LISTADO DE CUENTA CORRIENTE BANCARIA บ
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

STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
=WIN0()
PAG=ONE
=CABPAN()
=TIT_LIN(ONE)
SELE TMP
SCAN
	IF ROW()>21
		IF !FIN_LIN(ONE,NUL,LCCB2("SUBTOTAL",SALDO))
			EXIT
		ENDIF
		CLEA
		STOR PAG+ONE TO PAG
		=CABPAN()
		=TIT_LIN(TWO)
	ENDIF
	=LCCB1()
ENDSCAN
=FIN_LIN(TWO,CASOS,LCCB2("SUBTOTAL",SALDO))
=RELEWIN("WIN")
=IAUD("")
RETURN MEN_LIN(BOTOM)
