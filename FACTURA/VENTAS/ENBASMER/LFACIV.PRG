* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFACIV.PRG                                               บ
* บ COMENTARIO    : LISTADO DE FACTURAS POR PRODUCTO POR IMPRESORA           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 01-07-94                                                    บ
* บ HORA       : 08:59:10pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LINEA,TT,TTL,HAY
	=LFACV0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,IIF(HAY,PARSE(PAIP+"SUBTOTAL",STR(TTL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
			=CABPRI1()
			=TIT_LIN(FOUR)
		ENDI
		=LFACV1()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,IIF(HAY,PARSE(PAIP+"TOTAL",STR(TTL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
	ENDP
	=FINIMP()
	=REOPFAC()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
