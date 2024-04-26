* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMERPC.PRG                                               บ
* บ COMENTARIO    : LISTADO DE MERCADERIAS CARACTERISTICAS Y ALIMENTACION    บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-02-93                                                    บ
* บ HORA       : 02:47:31pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LNS,RUBR,SUBR,LARMEM
	=LMERM0(.T.,"RUB.PALISTAR,MI1.TEXTO1,MER.ARTICULO,MER.MERCA,MER.CAR1,MER.CAR2,MER.CAR3,MER.ALIM","LMERPC")
	=win0()
	PAG=1
	=cabpan()
	SELE MER
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
		ENDI
         ? PAIP
		?? articulo
		?? paip
		?? LEFT(merca,15)
		?? paip
		?? TEXTO1
		?? PAIP
		?? SAYMIX1(CAR1,"CARCOD")
		?? PAIP
		IF LMERPC1(CAR2)
			=LMERPC1(CAR3)
		ENDIF
		stor casos+1 TO casos
	ENDSCAN
	=fin_lns(2,casos)
	=RELEWIN("win")
	=IAUD(FISC)
	=REOPMER()
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN

FUNCTION LMERPC1
	PARAMETER L_CAR
	STORE .T. TO L_SALIDA
	IF !EMPTY(L_CAR)
	? PAIP
		?? SPACE(LEN(ARTICULO))
		??paip
		?? SPACE(15)
		??paip
		?? SPACE(20)
		?? paip
		?? SAYMIX1(L_CAR,"CARCOD")
		?? PAIP
	ELSE 
		STORE .F. TO L_SALIDA
	ENDIF
RETURN L_SALIDA
