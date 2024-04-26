********************************************************************************
*-- Programa: LRUBP.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE RUBROS POR PANTALLA
*-- Modificaci¢n GOYO 07-28-92 06:52pm
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	SELE rub
	SET ORDER TO TAG IIF(TYPE("ORDRUB")#'L' .OR. ORDRUB,'CODRUB','RUBRO')
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	acla='|POSIC|CODIGO|'+PADC("RUBRO",20)+"|FECHA IN|  USUARIO |"
	lns=REPL("=",LEN(acla))
	tt='Listado de Rubros'
	=tit_lns(1)
	SCAN
		IF ROW()>21
			IF !fin_lns(1,nul)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lns(2)
		ENDIF
		? paip
		?? STR(RECNO(),5)
		?? paip
		?? zero(CODRUB,6)
		?? paip
		?? rubro
		=impuse()
	ENDSCAN
	=fin_lns(2,casos)
	=rELEWIN("win")
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
