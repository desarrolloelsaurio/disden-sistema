* ษออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPREVP.PRG                   บ
* บ COMENTARIO    : LISTADO DE ESTADO DE CORTES  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                     บ
* บ FECHA      : 08-20-93                        บ
* บ HORA       : 00:45:57am                      บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER         บ
* ศออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

EXTERNAL ARRAY TOTLIN,TOTRUB,TOTTOT
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	PAG=ONE
	=CABPAN()
	TT=TTU+;
	CRLF+;
	"RUBRO:"+;
	ALLTRIM(SAYMIX(LEFT(ELART,3),"RUBCOD"))
	=TIT_LIN(ONE)
	STORE NUL TO TOTLIN
	SELE FAX
	SCAN
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL,LP_TORUB("Sttl RUBRO"))
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO)
		ENDIF
		*** SI CAMBIA EL ARTICULO
		IF ELART#FAX.AVI
			IF LEFT(ELART,3)#LEFT(FAX.AVI,3)
				=LPREV1()
				IF !FIN_LIN(ONE,NUL,LP_TORUB("Tot RUBRO"))
					EXIT
				ENDIF
				CLEA
				STOR PAG+ONE TO PAG
				=CABPAN()
				TT=TTU+;
				CRLF+;
				"RUBRO:"+;
				ALLTRIM(SAYMIX(LEFT(ELART,3),"RUBCOD"))
				=TIT_LIN(ONE)
				STORE NUL TO TOTRUB
			ELSE
				=LPREV1()
			ENDIF
		ENDIF
		*** SI CAMBIA EL ARTICULO
		STORE FAX.EEC+TOTLIN[FAX.POSIC] TO TOTLIN[FAX.POSIC]
	ENDSCAN
	IF LAST()#27
		=LPREV1()
		=FIN_LIN(ONE,NUL,LP_TORUB("T. RUBRO"),.T.)
		=FIN_LIN(ONE,NUL,LP_TOTAL())
	ENDIF
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
