* 浜様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LLEGCOR.PRG                     �
* � COMENTARIO    : LISTA LEGAJO DE ORDEN DE CORTE  �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                        �
* � FECHA      : JUNIO DE 1994                      �
* � HORA       : 01:50:15pm                         �
* � COPYRIGHT  : 1994 by GREGORIO REINER            �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	IF ESJEFE()
		STORE NUL TO RESPUESTA
		IF ELICOT("a Listar")
			STOR NUL TO CASOS
			LINEA=REPL("=",80)
			ACLA=""
			TT="LISTADO DE LEGAJO"+;
				CRLF+;
				"ORDEN DE CORTE N� "+ALLTRIM(STR(COR.NUMERO))
			=CABPRI()
			_PCOPIES=1
			PRINTJOB
			=CABPRI1()
			=TIT_LIN(3)
			SELE COR
			_ALIGNMENT="LEFT"
			?
			?
			? "Orden de Corte :"
			?? COR.NUMERO AT 40

			? "Fecha de Inicio:"
			?? COR.FECHAINI AT 40

			? "Art�culo:"
			?? COR.ARTICULO AT 40
			? SAYGRL(COR.ARTICULO,"MER","ARTIRED","MER.MERCA") AT 40

			? "Referencia:"
			?? COR.NRODOCREF AT 40

			? "Ordenado por:"
			?? COR.ORDENADO AT 40

			? "LEGAJO"
			? REPL("=",80)
			? COR.LEGAJO
			? REPL("=",80)
			ENDP
			EJECT PAGE
			=FINIMP()
			=IAUD("")
		ENDIF
	ELSE
		=NOSOSJEF()
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
