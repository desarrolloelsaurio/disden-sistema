* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : DEMORA1.PRG          บ
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
    ACLA=PAIP+;
    "NUMERO"+PAIP+;
    " ARTICULO "+PAIP+;
    "F. CORTE"+PAIP
    SELE MIX
    SET ORDER TO TAG CODEMO
    SCAN
    ACLA=ACLA+PADC(LEFT(MIX.TEXTO2,2)+"-"+MIX.TEXTO1,8)+PAIP
    ENDSCAN
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE CO1
	STORE "0" TO NUCOR
	STORE 1 TO VEZ
	SCAN
	   IF CO1.NUMERO#NUCOR
	   IF VEZ=1
	      VEZ=2
	      STORE CO1.NUMERO
	   ENDIF
	   ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
