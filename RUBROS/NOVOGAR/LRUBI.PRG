********************************************************************************
*-- Programa: LRUBI.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE RUBROS POR IMPRESORA
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
	stor nul TO casos
	stor '|POSIC|CODIGO|'+PADC("RUBRO",20)+"|FECHA IN|  USUARIO |" TO acla
	stor 'Listado de Rubros' TO tt
	=cabpri()
	LNS=M.LINEA
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LNS(3)
	SCAN
		IF _PLINENO>63
			=FIN_LNS(3,NUL)
			=cabpri1()
			=TIT_LNS(4)
		ENDI
		? paip
		?? STR(RECNO(),5)
		?? paip
		?? rubro
		?? paip
		?? ZERO(CODRUB,6)
		=IMPUSE()
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
