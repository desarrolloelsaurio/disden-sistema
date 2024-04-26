* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFACPV.PRG                                               บ
* บ COMENTARIO    : LISTADO DE FACTURAS POR MERCADERIAS POR PANTALLA         บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 01-07-94                                                    บ
* บ HORA       : 08:59:54pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LINEA,TT,TTL,HAY
	=LFACV0()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL,IIF(HAY,PARSE(PAIP+"SUBTOTAL",STR(TTL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		=LFACV1()
	ENDSCAN
	=FIN_LIN(TWO,CASOS,IIF(HAY,PARSE(PAIP+"TOTAL",STR(TTL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
	=RELEWIN("WIN")
	=REOPFAC()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
