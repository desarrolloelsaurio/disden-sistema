* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LALQAUTI.PRG                                             �
* � COMENTARIO    : LISTADO DE CONTRATOS AUTORIZADOS O NO POR IMPRESORA      �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-01-93                                                    �
* � HORA       : 01:50:15pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE PAIP     "|"                             && PAIP
#DEFINE BOTOM    " "+repl("�",78)                && BOTOM
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SELE ALQ
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		? PAIP
		?? CODINM
		?? PAIP
		?? DOMICILIO
		?? PAIP
		?? SAYPER(procod,"PRPCOD")
		?? PAIP
		?? sayPER(CODCLI,"INQCOD")
		?? PAIP
		?? FECHAALQ
		?? PAIP
		CASOS=CASOS+1
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
