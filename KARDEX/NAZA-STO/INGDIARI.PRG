* 浜様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : INGDIARI.PRG                  �
* � COMENTARIO    : INGRESO A KARDEX ENTRE FECHAS �
* 麺様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                      �
* � FECHA      : 11-01-93                         �
* � HORA       : 01:50:15pm                       �
* � COPYRIGHT  : 1993 by GREGORIO REINER          �
* 藩様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE TMP
	GO TOP
	LAREF=TMP.REFERENCIA
    LAORD=VAL(SUBS(TMP.REFERENCIA,3))
    =XSEEK(LAORD,"REQ","NUMERO")
	SCAN
		IF LAREF#TMP.REFERENCIA
	    	? M.LINEA
			LAREF=TMP.REFERENCIA
    		LAORD=VAL(SUBS(TMP.REFERENCIA,3))
		    =XSEEK(LAORD,"REQ","NUMERO")
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=CABPRI1()
			=TIT_LIN(FOUR)
		ENDIF
		=INGDIAR0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
