* ษออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPENDFP.PRG                    บ
* บ COMENTARIO    : LISTADO DE PENDIENTES AGRUPADO บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                       บ
* บ FECHA      : 08-20-93                          บ
* บ HORA       : 00:45:57am                        บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
PARAMETER PLEIN
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	SELE TMP
	GO TOP
	ELPRO=TMP.USUARIO
	IF PLEIN
		TT=TT+;
			CRLF+;
			"RESUMEN"
	ELSE
		TTORI=TT
		TT=TTORI+;
			CRLF+;
			ALLTRIM("PROVEEDOR:"+SAYPER(ELPRO,"PROCOD"))
	ENDIF
	STORE NUL TO TOMON,TTOMON,ELTOT,ELTTOT,ELPEN,PPEN
	=UNWORK()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SCAN
		IF TMP.USUARIO#ELPRO
			IF PLEIN
				=LPENDF0()
			ELSE
				IF !FIN_LIN(ONE,NUL,;
						PARSE(PAIP+SAYPER(ELPRO,"PROCOD"),;
						PAIP+STR(ELPEN,XACDIGI)+PAIP+STR(ELTOT,XACDIGI)+PAIP+STR(TOMON,XACDIGI)+PAIP,;
						LEN(ACLA)))
					EXIT
				ENDIF
				CLEA
				STORE NUL TO M.TOMON,M.ELTOT,M.ELPEN
				STOR PAG+ONE TO PAG
				ELPRO=TMP.USUARIO
				TT=TTORI+;
					CRLF+;
					ALLTRIM("PROVEEDOR:"+SAYPER(ELPRO,"PROCOD"))
				=CABPAN()
				=TIT_LIN(ONE)
			ENDIF
		ENDIF
		#IF "Win" $ vers()
			IF ROW()>(WROWS()-4)
			#ELSE
				IF ROW()>21
				#ENDIF
				IF !FIN_LIN(ONE,NUL)
					EXIT
				ENDIF
				CLEA
				STOR PAG+ONE TO PAG
				=CABPAN()
				=TIT_LIN(TWO)
			ENDIF
			=LPEND1()
		ENDSCAN
		IF PLEIN
			=LPENDF0()
			=FIN_LIN(TWO,NUL,PARSE(PAIP+PADC("TOTAL",30),PAIP+STR(PPEN,XACDIGI)+PAIP+STR(ELTTOT,XACDIGI)+PAIP+STR(TTOMON,XACDIGI)+PAIP,LEN(ACLA)))
		ELSE
			=FIN_LIN(TWO,NUL,PARSE(PAIP+SAYPER(ELPRO,"PROCOD"),PAIP+STR(ELPEN,XACDIGI)+PAIP+STR(ELTOT,XACDIGI)+PAIP+STR(TOMON,XACDIGI)+PAIP,LEN(ACLA)))
		ENDIF
		=RELEWIN("WIN")
		=IAUD(DTOC(M.FECINI)+"/"+DTOC(M.FECFIN))
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
