* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPERP.PRG            บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-16-93                บ
* บ HORA       : 02:09:52pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

=HORA_ULP()
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LINEA
	=LPER0()
	=WIN0()
	pag=1
	=cabpan()
	=tit_lin(1)
	SCAN FOR &FISC
			#IF "Win" $ vers()
			IF ROW()>(WROWS()-4)
			#ELSE
				IF ROW()>21
				#ENDIF
			IF !fin_lin(1,0)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		=lPER1()
	ENDSCAN
	=fin_lin(2,casos)
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
