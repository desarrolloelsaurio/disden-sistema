* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FABNTTTI.PRG           บ
* บ COMENTARIO    :                        บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 11-01-93                  บ
* บ HORA       : 01:50:15pm                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI(.F.,"36")
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3,ALLTRIM(ELPRCTEX))
	SELE FAX
	SCAN
		IF ELPRC#CLIENTE
			=FABNTTT0(3,ELPRCTEX)
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR,ALLTRIM(ELPRCTEX))
		ENDI
		=FABNTTT1()
	ENDSCAN
	=FABNTTT0(3,ELPRCTEX,.T.)
*	=FIN_LIN(FOUR,CASOSPARC,
	=FIN_LIN(FOUR,CASOS,FABNTTT2("TOTALES",TTTOT))
	ENDP
	=FINIMP()
	=IAUD("")
	=REOPFAB()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
