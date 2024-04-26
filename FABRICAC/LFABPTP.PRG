* ษอออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFABPTP.PRG                   บ
* บ COMENTARIO    : LISTADO DE PROCESOS TERMINADOSบ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                      บ
* บ FECHA      : 08-20-93                         บ
* บ HORA       : 00:45:57am                       บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER          บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=WIN0()
	PAG=1
	=CABPAN()
	=TIT_LIN(1)
	SELE TMP
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,IIF(HAY,FIN_SUM('SUBTOTAL',@TTL),.F.))
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		=LFABPT1()
	ENDSCAN
	=FIN_LIN(2,CASOS,IIF(HAY,FIN_SUM('TOTAL',@TTL),.F.))
	=RELEWIN("WIN")
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
