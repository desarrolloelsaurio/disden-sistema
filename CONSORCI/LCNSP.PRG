* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCNSP.PRG                       บ
* บ COMENTARIO    : LISTADO CONSORCIOS POR PANTALLA บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                        บ
* บ FECHA      : 12-29-93                           บ
* บ HORA       : 08:26:35pm                         บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER            บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE CNS
	SET ORDER TO TAG ORDCNS
	=WIN0()
	PAG=1
	=CABPAN()
	STORE NUL TO CASOS
	acla=paip+PADC("CONSORCIO",20)+paip+PADC("COD.",4)+paip+PADC("DIRECCION",40)+paip+PADC("LOCALIDAD",9)+paip
	LINEA=REPL("=",LEN(ACLA))
	tt='Listado de Consorcios'
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,0)
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		=LCNS1(.T.)
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("WIN")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
