* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQOKI.PRG                                              บ
* บ COMENTARIO    : LISTADO DE FINCAS EN CONDICIONES DE SER LIQUIDADAS       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-20-93                                                    บ
* บ HORA       : 00:45:18am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM    " "+repl("ฐ",78)                && BOTOM
#DEFINE NUL    0                                 && NUL
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE "" TO ACLA,LINEA,TT,CASOS,TTTL,GTTL,GCASOS
	STORE .F. TO PORPAN
	=LALQOK0()
	SELE ALQ
	GO TOP
	ELDIA=DIAVENC
	TTANT=TT
	TT=TTANT+CHR(13)+CHR(10)+"VENCIMIENTO DIA:"+STR(ELDIA)
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF ELDIA#DIAVENC
			=FIN_LIN(4,CASOS,PADL(STR(TTTL,XACDIGI,2),LEN(ACLA)-1))
			ELDIA=DIAVENC
			GTTL=GTTL+TTTL
			GCASOS=GCASOS+CASOS
			STORE NUL TO TTTL,CASOS
			TT=TTANT+CHR(13)+CHR(10)+"VENCIMIENTO DIA:"+STR(ELDIA)
			=CABPRI1()
			=TIT_LIN(3)
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL,PADL(STR(TTTL,XACDIGI,2),LEN(ACLA)-1))
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		TTTL=TTTL+LALQOK1()
	ENDSCAN
	=FIN_LIN(4,CASOS,PADL(STR(TTTL,XACDIGI,2),LEN(ACLA)-1),.T.)
	=FIN_LIN(4,GCASOS,PADL(STR(GTTL,XACDIGI,2),LEN(ACLA)-1))
	ENDP
	=FINIMP()
	=IAUD("")
	=REOPALQ()
	=REOPINM()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
