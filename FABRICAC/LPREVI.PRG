* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LPREVI.PRG                          �
* � COMENTARIO    : LISTADO DE PENDIENTES POR ARTICULO  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                            �
* � FECHA      : 11-01-93                               �
* � HORA       : 01:50:15pm                             �
* � COPYRIGHT  : 1993 by GREGORIO REINER                �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

EXTERNAL ARRAY TOTLIN,TOTRUB,TOTTOT

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	TT=TTU+;
	CRLF+;
	"RUBRO:"+;
	ALLTRIM(SAYMIX(LEFT(ELART,3),"RUBCOD"))
	=TIT_LIN(3)
	STORE NUL TO TOTLIN
	SELE FAX
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,LP_TORUB("Sttl RUBRO"))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		*** SI CAMBIA EL RUBRO
		IF ELART#FAX.AVI
			IF LEFT(ELART,3)#LEFT(FAX.AVI,3)
				=LPREV1()
				=FIN_LIN(3,NUL,LP_TORUB("Tot RUBRO"))
				=cabpri1()
				TT=TTU+;
				CRLF+;
				"RUBRO:"+;
				ALLTRIM(SAYMIX(LEFT(ELART,3),"RUBCOD"))
				=TIT_LIN(FOUR)
				STORE NUL TO TOTRUB
			ELSE
				=LPREV1()
			ENDIF
		ENDIF
		*** SI CAMBIA EL ARTICULO
		STORE FAX.EEC+TOTLIN[FAX.POSIC] TO TOTLIN[FAX.POSIC]
	ENDSCAN
	=LPREV1()
	=FIN_LIN(FOUR,NUL,LP_TORUB("T. RUBRO"),.T.))
	=FIN_LIN(FOUR,NUL,LP_TOTAL())
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
