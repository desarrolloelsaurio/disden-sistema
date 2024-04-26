* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : STKHISP.PRG                           บ
* บ COMENTARIO    : LISTADO HISTORICO DE STOCK VALORIZADO บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                              บ
* บ FECHA      : 08-20-93                                 บ
* บ HORA       : 00:45:57am                               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                  บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=WIN0()
	PAG=ONE
	=CABPAN()
	=TIT_LIN(ONE)
	SELE TMP
	GO TOP
	COD_CTRL=ELCOD()
	TEX_CTRL=ELTEX()
	MON_CTRL=ELMON()
	UNI_CTRL=ELUNI()
	STORE NUL TO M.SAL,M.ENT,M.MONTOTO
	SCAN
		IF COD_CTRL#ELCOD()
			=STKHIS0()
			COD_CTRL=ELCOD()
			TEX_CTRL=ELTEX()
			MON_CTRL=ELMON()
			UNI_CTRL=ELUNI()
			STORE NUL TO M.SAL,M.ENT
		ELSE
			M.SAL=M.SAL+TMP.SALIDA
			M.ENT=M.ENT+TMP.ENTRADA
		ENDIF
		#IF "Win" $ vers()
			IF ROW()>(WROWS()-4)
			#ELSE
				IF ROW()>21
				#ENDIF

				IF !FIN_LIN(ONE,NUL,;
						PARSE("| SUBTOTAL",STR(M.MONTOTO,XACDIGI+2,2)+PAIP,LEN(ACLA)))
					EXIT
				ENDIF
				CLEA
				STOR PAG+ONE TO PAG
				=CABPAN()
				=TIT_LIN(TWO)
			ENDIF
		ENDSCAN
		=STKHIS0()
		=FIN_LIN(TWO,CASOS,;
			PARSE("| TOTAL",STR(M.MONTOTO,XACDIGI+2,2)+PAIP,LEN(ACLA)))
		=RELEWIN("WIN")
		=IAUD("")
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
