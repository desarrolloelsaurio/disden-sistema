* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCONVENI.PRG                       บ
* บ COMENTARIO    : LISTADO DE VENCIMIENTO DE CONTRATO บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                           บ
* บ FECHA      : 12-09-93                              บ
* บ HORA       : 09:13:30pm                            บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
