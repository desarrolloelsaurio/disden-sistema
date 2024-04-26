* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMERIM.PRG                      บ
* บ COMENTARIO    : LISTA DESCRIPCION POR IMPRESORA บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                        บ
* บ FECHA      : 08-29-93                           บ
* บ HORA       : 11:21:34pm                         บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LNS,RUBR,SUBR,LARMEM
	=LMERM0(.T.,"RUB.PALISTAR,MI1.TEXTO1,MER.ARTICULO,MER.MERCA1")
	SELE MER
	GO TOP
	TODO=PALISTAR
	RUBR=LEFT(TODO,20)
	SUBR=SUBSTR(TODO,21)
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=LMERM2(3)
	SCAN
		IF TODO#PALISTAR
			=FIN_LNS(3,NUL)
			=CABPRI1()
			=LMERM2(4)
		ELSE
			IF _PLINENO>63
				=FIN_LNS(3,NUL)
				=CABPRI1()
				=LMERM2(4)
			ENDIF
		ENDIF
		=LMERM1()
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPMER()
ELSE
	=IAUDi()
ENDIF
RETURN MEN_LIN(BOTOM)
