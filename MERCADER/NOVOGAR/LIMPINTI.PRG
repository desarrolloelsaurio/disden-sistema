* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LIMPINTI.PRG                                             �
* � COMENTARIO    : LISTA IMPUESTOS INTERNOS POR IMPRESORA                   �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-29-93                                                    �
* � HORA       : 11:21:34pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE mer
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
				=fin_lns(3,nul)
				=CABPRI1()
				=LMERM2(4)
			ENDIF
		ENDIF
		=LIMPINT1()
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
