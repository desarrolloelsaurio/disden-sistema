* ษออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMERPP.PRG                     บ
* บ COMENTARIO    : LISTADO DE MARCAS POR PANTALLA บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                       บ
* บ FECHA      : 09-02-93                          บ
* บ HORA       : 03:01:49am                        บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LNS,RUBR,SUBR,LARMEM
	=LMERM0(.T.,"RUB.PALISTAR,MI1.TEXTO1,MER.ARTICULO,MER.MERCA","LMERPP")
	=WIN0()
	=cabpan()
	SELE MER
	GO TOP
	TODO=PALISTAR
	RUBR=LEFT(TODO,20)
	SUBR=SUBSTR(TODO,21)
	STORE 1 TO PAG
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
		? paip
		?? articulo
		??paip
		?? merca
		?? paip
		?? TEXTO1
		?? paip
		stor casos+1 TO casos
	ENDSCAN
	=fin_lns(2,casos)
	=RELEWIN("win")
	=IAUD(FISC)
	=REOPMER()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
