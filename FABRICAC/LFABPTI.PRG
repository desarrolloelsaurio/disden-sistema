* 浜様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LFABPTI.PRG                    �
* � COMENTARIO    : LISTADO DE PROCESOS TERMINADOS �
* 麺様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                       �
* � FECHA      : 11-23-93                          �
* � HORA       : 10:31:41am                        �
* � COPYRIGHT  : 1993 by GREGORIO REINER           �
* 藩様様様様様様様様様様様様様様様様様様様様様様様夕
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE TMP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,IIF(HAY,FIN_SUM('SUBTOTAL',@TTL),.F.))
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LFABPT1()
	ENDSCAN
	=FIN_LIN(4,CASOS,IIF(HAY,FIN_SUM('TOTAL',@TTL),.F.))
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
