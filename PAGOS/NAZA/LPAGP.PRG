* 浜様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LPAGP.PRG             �
* � COMENTARIO    : LISTADO DE PAGOS      �
* 麺様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER              �
* � FECHA      : 08-20-93                 �
* � HORA       : 00:45:57am               �
* � COPYRIGHT  : 1993 by GREGORIO REINER  �
* 藩様様様様様様様様様様様様様様様様様様様�
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARA AVIOS, POR_DIA, ALIAS_TMP
EXTERNAL ARRAY L_FUNC
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=UNWORK()
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	DIME LLIN[C_MAX], LLINT[C_MAX]
	STORE NUL TO LLINT,LLIN
	SELE (ALIAS_TMP)
	GO TOP
	STORE "" TO M.CODCORTE, M.DESCRIPC
	STORE .T. TO L_BORRA
	DO CORTEPAG
	SCAN
		if ESCORPAG()
			=LPAG0(M.DESCRIPC,@LLIN,.T.)
			IF ROW()>20
				? M.LINEA
				=LPAG0("SUBTOTAL",@LLINT)
				IF !FIN_LIN(ONE,NUL)
					EXIT
				ENDIF
				CLEA
				STOR PAG+ONE TO PAG
				=CABPAN()
				=TIT_LIN(TWO)
			ENDIF
		ENDIF
		=LPAG1()
	ENDS
	=LPAG0(M.DESCRIPC,@LLIN,.T.)
	? M.LINEA
	=LPAG0("TOTAL",@LLINT)
	=FIN_LIN(TWO,CASOS)
	=RELEWIN("WIN")
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

