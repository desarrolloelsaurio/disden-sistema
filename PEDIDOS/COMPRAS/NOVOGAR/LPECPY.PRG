********************************************************************************
*-- Programa: LPECYP.PRG
*-- Fecha   : 02-05-93 03:53pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE PEDIDOS - RANKING POR MERCADERIA O MONTO
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

PARAMETER ULPR,B_ASE
=HORA_ULP(PROGRAM())
IF CHEQSEG()
	store "" to linea,acla
	STORE NUL TO GCAN,GMON
	=LPECPO(GENTMP(),B_ASE)
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	=TIT_LIN(1)
	SELE LIS
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,;
				PADR("|TOTAL",17)+PAIP+SPACE(30)+;
				IIF(FILART=1,SPACE(11)+PAIP,PAIP)+;
				STR(GCAN,XACDIGI)+PAIP+;
				STR(GMON,XACDIGI,2)+PAIP))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LPECY1()
	ENDSCAN
	=FIN_LIN(2,CASOS,;
	PADR("|TOTAL",17)+PAIP+SPACE(30)+;
	IIF(FILART=1,SPACE(11)+PAIP,PAIP)+;
	STR(GCAN,XACDIGI)+PAIP+;
	STR(GMON,XACDIGI,2)+PAIP))
	=RELEWIN("win")
	=IAUD(FISC)
	SELE 25
	USE
	IF B_ASE="PEC"
		=REOPPEC()
	ELSE
		=REOPPEC()
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
