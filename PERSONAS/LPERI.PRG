* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LPERI.PRG            �
* � COMENTARIO    :                      �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 11-16-93                �
* � HORA       : 02:10:17pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL

=HORA_ULP()
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LINEA
	=LPER0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN FOR &FISC
		IF _PLINENO>63
			=FIN_LIN(3,0)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LPER1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
