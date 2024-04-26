* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LREQVENI.PRG                                    บ
* บ COMENTARIO    : ORDENES DE REQUERIMIENTO VENCIDAS Y NO CERRADAS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                        บ
* บ FECHA      : 11-01-93                                           บ
* บ HORA       : 01:50:15pm                                         บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE IMPRIMIENDO  PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ') && IMPRIMIENDO
PARAMETER ELTIPO, PORPAN
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	M.FECINI=INFEC("WIN","Lกmite del Listado")
	IF LAST()#27 .AND. !EMPTY(M.FECINI)
		=IMPRESOR()
		=WORKING()
		=OPAVIS()
		=OPTELS()
		=OPCOMS()
		=OPPRO()
		=OPREQ()
		TMP=GENTMP()
		SELE REQ
		=FLOCK() .OR. FLOK()
		SORT ON NUMERO FOR ;
			fechaprom<=M.FECINI .AND. ;
			!COMPLETO ;
			TO (TMP)
		USE IN REQ
		USE (TMP) ALIAS REQ EXCL
		INDEX ON NUMERO TAG NUMERO
		SET ORDER TO TAG NUMERO
		FISC="!EMPTY(REQ.NUMERO)"
		=MEN_LIN(IMPRIMIENDO)
		DO CASE
		CASE ELTIPO="A"
			FISC=FISC+" .AND. !EMPTY(REQX.AVICODPRO)"
		CASE ELTIPO="T"
			FISC=FISC+" .AND. !EMPTY(REQX.TELCODPRO)"
		CASE ELTIPO="C"
			FISC=FISC+" .AND. !EMPTY(REQX.COMCODPRO)"
		CASE ELTIPO="M"
			FISC=FISC+" .AND. !EMPTY(REQX.ARTICULO)"
		ENDCASE

		SELE REQX
		SET ORDER TO TAG NUMERO
		SET RELA TO NUMERO INTO REQ
		IF PORPAN
			REPO FORM LREQVEN1 FOR !EMPTY(REQ.NUMERO) ;
				TO PRIN NOCONSOLE NOEJECT
		ELSE
			REPO FORM LREQVEN1 FOR !EMPTY(REQ.NUMERO) ;
				TO PREV
		ENDIF
		=IAUD(DTOC(M.FECINI))
		=OFF_TMP()
		=OPREQ()
		=UNWORK()
		=BEEP(3)
	ELSE
		=NOSELEC("FECHA")
	ENDIF
ELSE
	=IAUDI()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)
