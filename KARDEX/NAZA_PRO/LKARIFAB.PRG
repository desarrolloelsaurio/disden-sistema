* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKARIFAB.PRG                                             �
* � COMENTARIO    : LISTADO DE KARDEX - ORDEN DE FABRICACION                 �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-16-93                                                    �
* � HORA       : 12:24:30pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS,LINEA,ACLA,SUMA,RESTA
	=LKARPTA0(.T.)
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,PARSE("SUBTOTAL",STR(SUMA-RESTA,XACDIGI),LEN(ACLA)-1)))
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LKARFAB1()
	ENDSCAN
	=FIN_LIN(4,CASOS,PARSE("TOTAL",STR(SUMA-RESTA,XACDIGI),LEN(ACLA)-1)))
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
