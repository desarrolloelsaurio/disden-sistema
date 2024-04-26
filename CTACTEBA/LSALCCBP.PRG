* ษออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LSALCCBP.PRG                   บ
* บ COMENTARIO    : LISTA SALDOS CUENTAS BANCARIAS บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                       บ
* บ FECHA      : 08-20-93                          บ
* บ HORA       : 00:45:57am                        บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออผ
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
SELE MIX
SET ORDER TO TAG BANCOD
SCAN
	IF ROW()>21
		IF !FIN_LIN(ONE,NUL,LSALCCB2("SUBTOTAL"))
			EXIT
		ENDIF
		CLEA
		STOR PAG+ONE TO PAG
		=CABPAN()
		=TIT_LIN(TWO)
	ENDIF
	=LSALCCB1()
ENDSCAN
=FIN_LIN(TWO,CASOS,LSALCCB2("TOTAL"))
=RELEWIN("WIN")
=IAUD("")
RETURN MEN_LIN(BOTOM)
