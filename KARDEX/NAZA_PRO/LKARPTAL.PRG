* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKARPTAL.PRG                                             �
* � COMENTARIO    : LISTADO DE KARDEX - TALLERES                             �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-16-93                                                    �
* � HORA       : 11:10:38am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
