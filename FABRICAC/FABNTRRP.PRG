* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FABNTRRP.PRG                             บ
* บ COMENTARIO    : PROCESOS NO TERMINADOS - RUBRO POR RUBRO บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                 บ
* บ FECHA      : 08-20-93                                    บ
* บ HORA       : 00:45:57am                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	CLEA
	STOR ONE TO PAG
	=CABPAN()
	=TIT_LIN(TWO,ELRUBTEX)
	SELE FAX
	SCAN
		IF ELRUB#LEFT(ARTICULO,3)
			IF FABNTRR0(ONE,ELRUBTEX)
				EXIT
			ENDIF
		ENDIF
		IF ROW()>21
			IF !FIN_LIN(ONE,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+ONE TO PAG
			=CABPAN()
			=TIT_LIN(TWO,ELRUBTEX)
		ENDIF
		=FABNTRR1()
	ENDSCAN
	=FIN_LIN(TWO,CASOSPARC,FABNTRR0(ONE,ELRUBTEX))
	=FIN_LIN(TWO,CASOS,FABNTRR2("TOTALES",TTTOT))
	=RELEWIN("WIN")
	=IAUD("")
	=REOPFAB()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
