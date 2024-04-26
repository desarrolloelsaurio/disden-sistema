* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPERI.PRG            บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-16-93                บ
* บ HORA       : 02:10:17pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL

=HORA_ULP()
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LINEA
	=LPER0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN FOR &FISC
		IF _PLINENO>63
			=FIN_LIN(3,0)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LPER1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
