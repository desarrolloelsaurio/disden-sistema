* ษออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFABPTI.PRG                    บ
* บ COMENTARIO    : LISTADO DE PROCESOS TERMINADOS บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                       บ
* บ FECHA      : 11-23-93                          บ
* บ HORA       : 10:31:41am                        บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออผ
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
