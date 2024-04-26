* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LGRLI.PRG                              บ
* บ COMENTARIO    : LISTADO GENERAL PARA CONCEPTOS SIMPLES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                               บ
* บ FECHA      : 11-01-93                                  บ
* บ HORA       : 01:50:15pm                                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                   บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* L_ALIAS   : ALIAS DE LA BASE A LISTAR
* L_LISTADO : NOMBRE DEL PROGRAMA QUE IMPRIME (EJ: "LCIU0()")
* L_AUDI    : TEXTO A CARGAR A LA AUDITORIA
* ULPR      : NOMBRE DEL PROGRAMA PARA EL CHEQSEG Y EL IAUD
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX

PARAMETER L_ALIAS,L_LISTADO,L_AUDI,ULPR,TOTALIZA,ELPI1,RE_PETIR
IF CHEQSEG()
	IF TYPE("TOTALIZA")="N"
		DIME TOTAL[TOTALIZA]
		STORE .T. TO TOTALIZA
	ENDIF
	STOR NUL TO CASOS,LARGO,LARGOIM,TOTAL,STOTAL
	IF EMPTY(ELPI1)
		ELPI1=RIGHT(PICUMAX,XACDIGI)
	ENDIF
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	IF TYPE("PORBASE")#"U" .AND. PORBASE
		SELE (L_ALIAS)
		COPY TO (PATH+"\"+XA)
		L_AUDI="BASE: "+ALLTRIM(XA)+" / "+ALLTRIM(L_AUDI)
		RELE XA
	ELSE
		_PCOPIES=IIF(EMPTY(RE_PETIR),1,REPETIR)
		PRINTJOB
		=CABPRI1()
		=TIT_LIN(3)
		SELE (L_ALIAS)
		IF TYPE("XALARGO")#"U" .AND. !EMPTY(M.XALARGO)
			LIMITELIN=M.XALARGO-9
		ELSE
			LIMITELIN=63
		ENDIF
		SCAN
			IF _PLINENO>LIMITELIN
				=FIN_LIN(3,NUL,;
					IIF(TOTALIZA,;
					PARSE("| SUBTOTAL",IIF(ISARRAY(@TOTAL),SAYTOT(),TRANS(M.TOTAL,ELPI1)+"|"),LEN(ACLA));
					,.F.))
				=CABPRI1()
				=TIT_LIN(FOUR)
			ENDI
			=EVAL(L_LISTADO)
		ENDSCAN
		=FIN_LIN(FOUR,CASOS,;
			IIF(TOTALIZA,;
			PARSE("| TOTAL",IIF(ISARRAY(@TOTAL),SAYTOT(),TRANS(M.TOTAL,ELPI1)+"|"),LEN(ACLA));
			,.F.))
		ENDP
		=FINIMP()
	ENDIF
	=IAUD(L_AUDI)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
