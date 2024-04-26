* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARPTAL.PRG                                             บ
* บ COMENTARIO    : LISTADO DE KARDEX - TALLERES                             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 11:10:38am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE NUL TO CASOS,ACLA,SUMA,RESTA
	=LKARPTA0()
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SELE KAR
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,STR(SUMA-RESTA))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LKARPTA1()
	ENDSCAN
	=FIN_LIN(2,CASOS,STR(SUMA-RESTA))
	=RELEWIN("win")
	=REOPKAR()
  =IAUD(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
