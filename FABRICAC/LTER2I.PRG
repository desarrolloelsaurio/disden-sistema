* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LTER3I.PRG                                   บ
* บ COMENTARIO    : LISTADO DE PRODUCCION TERMINADA POR ARTICULO บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                     บ
* บ FECHA      : 11-01-93                                        บ
* บ HORA       : 01:50:15pm                                      บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                         บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE TMP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LTER20()
	ENDSCAN
	=LTER20()
	=FIN_LIN(FOUR,CASOS,;
	PAIP+;
	PADC("TOTALES",10)+;
	PAIP+;
	SPACE(20)+;
	PAIP+;
	STR(TTER1,10)+;
	PAIP+;
	STR(TTER2,10)+;
	PAIP+;
	STR(TTER1+TTER2,10)+;
	PAIP+;
	STR(TTER2*100/(TTER1+TTER2),7,2)+PAIP)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
