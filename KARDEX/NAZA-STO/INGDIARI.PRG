* ษอออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INGDIARI.PRG                  บ
* บ COMENTARIO    : INGRESO A KARDEX ENTRE FECHAS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                      บ
* บ FECHA      : 11-01-93                         บ
* บ HORA       : 01:50:15pm                       บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER          บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE TMP
	GO TOP
	LAREF=TMP.REFERENCIA
    LAORD=VAL(SUBS(TMP.REFERENCIA,3))
    =XSEEK(LAORD,"REQ","NUMERO")
	SCAN
		IF LAREF#TMP.REFERENCIA
	    	? M.LINEA
			LAREF=TMP.REFERENCIA
    		LAORD=VAL(SUBS(TMP.REFERENCIA,3))
		    =XSEEK(LAORD,"REQ","NUMERO")
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=CABPRI1()
			=TIT_LIN(FOUR)
		ENDIF
		=INGDIAR0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
