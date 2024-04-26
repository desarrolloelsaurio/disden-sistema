* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQAUTI.PRG                                             บ
* บ COMENTARIO    : LISTADO DE CONTRATOS AUTORIZADOS O NO POR IMPRESORA      บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE PAIP     "|"                             && PAIP
#DEFINE BOTOM    " "+repl("ฐ",78)                && BOTOM
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SELE ALQ
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		? PAIP
		?? CODINM
		?? PAIP
		?? DOMICILIO
		?? PAIP
		?? SAYPER(procod,"PRPCOD")
		?? PAIP
		?? sayPER(CODCLI,"INQCOD")
		?? PAIP
		?? FECHAALQ
		?? PAIP
		CASOS=CASOS+1
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
