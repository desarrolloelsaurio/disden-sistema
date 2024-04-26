* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LGRLP.PRG                                      บ
* บ COMENTARIO    : LISTADO "GENERAL" PARA CONCEPTOS SIN PROBLEMAS บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                       บ
* บ FECHA      : 08-20-93                                          บ
* บ HORA       : 00:45:57am                                        บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* L_ALIAS   : ALIAS DE LA BASE A LISTAR
* L_LISTADO : NOMBRE DEL PROGRAMA QUE IMPRIME (EJ: "LCIU0()")
* L_AUDI    : TEXTO A CARGAR A LA AUDITORIA
* ULPR      : NOMBRE DEL PROGRAMA PARA EL CHEQSEG Y EL IAUD
* TOTALIZA  : .T. SI TOTALIZA C/UN TOTAL, SI ES NUMERICO ES LA CANTIDAD DE
*             ELEMENTOS DEL ARRAY
* ELPI1     : PICTURE DEL TOTAL
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX

PARAMETER L_ALIAS,L_LISTADO,L_AUDI,ULPR,TOTALIZA,ELPI1,RE_PETIR
=CHEQSEG()
STOR NUL TO CASOS,LARGO,LARGOIM, STOTAL
LINEA=REPL("=",LEN(ACLA))
IF TYPE("TOTALIZA")="N"
	DIME TOTAL[TOTALIZA]
	STORE .T. TO TOTALIZA
ENDIF
IF EMPTY(ELPI1)
	ELPI1=RIGHT(PICUMAX,XACDIGI)
ENDIF
STORE NUL TO M.TOTAL
=UNWORK()
=WIN0()
PAG=ONE
=CABPAN()
=TIT_LIN(ONE)
SELE (L_ALIAS)
SCAN
	#IF "Win" $ vers()
		IF ROW()>(WROWS()-4)
	#ELSE
		IF ROW()>21
	#ENDIF
			IF !FIN_LIN(ONE,NUL,;
					IIF(TOTALIZA,;
					PARSE("| SUBTOTAL",IIF(ISARRAY(@TOTAL),SAYTOT(),TRANS(M.TOTAL,ELPI1)+"|"),LEN(ACLA));
					,.F.))
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		=EVAL(L_LISTADO)
	ENDSCAN
	=FIN_LIN(TWO,CASOS,;
		IIF(TOTALIZA,;
		PARSE("| TOTAL",IIF(ISARRAY(@TOTAL),SAYTOT(),TRANS(M.TOTAL,ELPI1)+"|"),LEN(ACLA));
		,.F.))
	=RELEWIN("WIN")
	=IAUD(L_AUDI)
RETURN MEN_LIN(BOTOM)
