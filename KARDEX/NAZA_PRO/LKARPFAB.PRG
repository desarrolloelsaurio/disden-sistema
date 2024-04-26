* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARPFAB.PRG                                             บ
* บ COMENTARIO    : LISTADO DE KARDEX - POR ORDEN DE FABRRICACION            บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 11:57:52am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO LNS,ACLA,SUMA,RESTA,CASOS
	=LKARPTA0(.T.)
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,PARSE("SUBTOTAL",STR(SUMA-RESTA,12),LEN(ACLA)-1))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LKARFAB1()
	ENDSCAN
	=FIN_LIN(2,NUL,PARSE("SUBTOTAL",STR(SUMA-RESTA,12),LEN(ACLA)-1))
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
