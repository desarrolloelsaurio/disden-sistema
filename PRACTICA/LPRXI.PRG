* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LPRXI.PRG                                                �
* � COMENTARIO    : LISTADO DE COMPONENTES DE PRACTICAS                      �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-01-93                                                    �
* � HORA       : 01:50:15pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
    TT=TT1
	=CABPRI1()
	=TIT_LIN(3)
	STORE 1 TO CASOS
	SELE PRX
	? PRX.CODPRX
	?? " "
	?? LEFT(M.LINEA,LEN(ACLA)-LEN(PRX.CODPRX)-1)
	SCAN
      IF ELCOD#PRX.CODPRX
         ELCOD=PRX.CODPRX
         CASOS=CASOS+1
         ? M.LINEA
	? PRX.CODPRX
	?? " "
	?? LEFT(M.LINEA,LEN(ACLA)-LEN(PRX.CODPRX)-1)
      ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LPRX0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
