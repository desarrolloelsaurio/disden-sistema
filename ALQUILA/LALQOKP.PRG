* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQOKP.PRG                                              บ
* บ COMENTARIO    : LISTADO DE FINCAS EN CONDICIONES DE SER LIQUIDADAS       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-20-93                                                    บ
* บ HORA       : 00:45:18am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO ACLA,LINEA,TT,CASOS,TTTL,GTTL,GCASOS
	STORE .T. TO PORPAN
	=LALQOK0()
	=UNWORK()
	=WIN0()
	PAG=1
	=CABPAN()
	SELE ALQ
	GO TOP
	ELDIA=DIAVENC
	TTANT=TT
	TT=TTANT+CHR(13)+CHR(10)+"VENCIMIENTO DIA:"+STR(ELDIA)
	=TIT_LIN(1)
	SCAN
		IF ELDIA#DIAVENC
			=FIN_LIN(2,CASOS,PADL(STR(TTTL,XACDIGI,2),LEN(ACLA)-1))
			ELDIA=DIAVENC
			GTTL=GTTL+TTTL
			GCASOS=GCASOS+CASOS
			STORE NUL TO TTTL,CASOS
			TT=TTANT+CHR(13)+CHR(10)+"VENCIMIENTO DIA:"+STR(ELDIA)
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(1)
		ENDIF
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		TTTL=TTTL+LALQOK1()
	ENDSCAN
	=FIN_LIN(2,CASOS,PADL(STR(TTTL,XACDIGI,2),LEN(ACLA)-1),.T.)
	=FIN_LIN(2,GCASOS,PADL(STR(GTTL,XACDIGI,2),LEN(ACLA)-1))
	=RELEWIN("win")
	=REOPINM()
	=REOPALQ()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
