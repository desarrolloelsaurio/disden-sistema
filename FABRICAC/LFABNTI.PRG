* 浜様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LFABNTI.PRG                   �
* � COMENTARIO    : LISTADO DE ORDENES PENDIENTES �
* 麺様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                      �
* � FECHA      : 11-22-93                         �
* � HORA       : 01:36:29am                       �
* � COPYRIGHT  : 1993 by GREGORIO REINER          �
* 藩様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE FAX
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,IIF(HAY,FIN_SUM("SUBTOTAL",@TTL),.F.))
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LFABNT1()
	ENDSCAN
	=FIN_LIN(4,CASOS,IIF(HAY,FIN_SUM("TOTAL",@TTL),.F.))
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
