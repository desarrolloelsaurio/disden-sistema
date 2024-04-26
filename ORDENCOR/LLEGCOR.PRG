* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LLEGCOR.PRG                     บ
* บ COMENTARIO    : LISTA LEGAJO DE ORDEN DE CORTE  บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                        บ
* บ FECHA      : JUNIO DE 1994                      บ
* บ HORA       : 01:50:15pm                         บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
				"ORDEN DE CORTE Nง "+ALLTRIM(STR(COR.NUMERO))
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

			? "Artกculo:"
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
