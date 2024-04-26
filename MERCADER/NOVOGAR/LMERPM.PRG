* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMERPM.PRG                                               บ
* บ COMENTARIO    : LISTA DESCRIPCION POR PANTALLA                           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-29-93                                                    บ
* บ HORA       : 11:21:52pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LNS,RUBR,SUBR,LARMEM
	=LMERM0(.T.,"RUB.PALISTAR,MI1.TEXTO1,MER.ARTICULO,MER.MERCA1")
	=win0()
	PAG=1
	=cabpan()
	GO TOP
	TODO=PALISTAR
	RUBR=LEFT(TODO,20)
	SUBR=SUBSTR(TODO,21)
	=LMERM2(1)
	SCAN
		IF TODO#PALISTAR
			IF !FIN_LNS(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=LMERM2(2)
		ELSE
			IF ROW()>21
				IF !FIN_LNS(1,NUL)
					EXIT
				ENDIF
				CLEA
				STOR pag+1 TO pag
				=cabpan()
				=LMERM2(2)
			ENDIF
		ENDIF
		IF LMERM1()
			EXIT
		ENDIF
	ENDSCAN
	=FIN_LNS(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
	=REOPMER()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
