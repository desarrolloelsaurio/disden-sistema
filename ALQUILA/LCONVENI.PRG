* 浜様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LCONVENI.PRG                       �
* � COMENTARIO    : LISTADO DE VENCIMIENTO DE CONTRATO �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                           �
* � FECHA      : 12-09-93                              �
* � HORA       : 09:13:30pm                            �
* � COPYRIGHT  : 1993 by GREGORIO REINER               �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION LCONVENI
	STORE HORA_ULP(program()) TO ULPR
	IF CHEQSEG()
		=CABPRI()
		_PCOPIES=1
		PRINTJOB
		=CABPRI1()
		=TIT_LIN(3)
		SELE ALQ
		SCAN
			IF _PLINENO>63
				=FIN_LIN(3,NUL)
				=cabpri1()
				=TIT_LIN(4)
			ENDI
			=LCONVEN0()
		ENDSCAN
		=FIN_LIN(4,CASOS)
		EJECT PAGE
		ENDP
		=FINIMP()
		=IAUD('')
	ELSE
		=IAUDI()
	ENDIF
RETURN
