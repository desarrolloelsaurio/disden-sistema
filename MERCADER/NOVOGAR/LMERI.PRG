* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LMERI.PRG                                                �
* � COMENTARIO    : LISTA MERCADERIA POR IMPRESORA                           �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-03-93                                                    �
* � HORA       : 02:45:10pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE PAIP   "|"                               && PAIP
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LNS,RUBR,SUBR
	=LMERM0(.F.,"RUB.PALISTAR,MI1.TEXTO1,MER.ARTICULO,MER.MERCA,MER.TEMPORADA,AUD.DETALLE,MER.LINEA,MER.JEAN",ULPR)
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	SCAN
		IF _PLINENO>63
			=FIN_LNS(3,NUL)
			=CABPRI1()
			=TIT_LNS(4)
		ENDI
		? articulo
		?? PAIP
		?? LEFT(PALISTAR,15)
		?? PAIP
		?? SUBSTR(PALISTAR,21,15)
		?? PAIP
		?? LEFT(TEXTO1,15)
		?? paip
		?? merca
		?? paip
		?? LEFT(qtem(temporada),9)
		?? paip
		?? LEFT(DETALLE,15)
		?? PAIP
		?? IIF(JEAN,' SI',' NO')
		CASOS=CASOS+1
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPMER()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
