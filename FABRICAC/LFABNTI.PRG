* ษอออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFABNTI.PRG                   บ
* บ COMENTARIO    : LISTADO DE ORDENES PENDIENTES บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                      บ
* บ FECHA      : 11-22-93                         บ
* บ HORA       : 01:36:29am                       บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER          บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
