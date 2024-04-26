* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FABNTRRI.PRG         บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-01-93                บ
* บ HORA       : 01:50:15pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1

	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3,ELRUBTEX)
	SELE FAX
	SCAN
		IF ELRUB#LEFT(ARTICULO,3)
			=FABNTRR0(3,ELRUBTEX)
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR,ELRUBTEX)
		ENDI
		=FABNTRR1()
	ENDSCAN
	=FIN_LIN(FOUR,CASOSPARC,FABNTRR0(3,ELRUBTEX),.T.)
	=FIN_LIN(FOUR,CASOS,FABNTRR2("TOTALES",TTTOT))
	ENDP
	=FINIMP()
	=IAUD("")
	=REOPFAB()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
