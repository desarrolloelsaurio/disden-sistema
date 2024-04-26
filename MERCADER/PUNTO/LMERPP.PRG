********************************************************************************
*-- Programa: LMERPP.PRG
*-- Fecha   : 06/13/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE MERCADERIAS,SIN DENOMINACION COMERCIAL, POR PANTALLA
*-- Modificaci¢n GOYO 05-17-92 12:43pm
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE mer
	=WIN0()
	PAG=1
	=CABPAN()
	STOR NUL TO casos
	acla=PAIP+PADC("ARTICULO",13)+PAIP+"TEM.|"+PADC("SEXO",4)+PAIP+PADC("LINEA",11)
	ACLA=ACLA+PAIP+PADC("MARCA",11)+PAIP+PADC("RUBRO",9)+PAIP+PADC(UPPER(mader),9)+PAIP+PADC(UPPER(tella),6)+PAIP
	ACLA=ACLA+"JEA"
	lns=REPL("=",LEN(acla))
	=TIT_LNS(1)
	pag=1
	SCAN
		IF ROW()=21
			IF !FIN_LNS(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LNS(2)
		ENDIF
		? PAIP
		?? LEFT(ARTICULO,13)
		?? PAIP
		?? LEFT(QTEM(MER.TEMPORADA),4)
		?? PAIP
		?? LEFT(QSEX(MER.SEXO),4)
		??PAIP
		?? SAYMIX(MER.LINEA,"LINCOD",11)
		?? PAIP
		?? SAYMIX(MER.MARCA,"MARCOD",11)
		?? PAIP
		?? SAYMIX(MER.RUBRO,"RUBCOD",9)
		?? PAIP
		?? SAYMIX(MER.MATERIAL,"MATCOD",9)
		?? PAIP
		?? SAYMIX(MER.TELA,"TELCOD",6)
		?? PAIP
		?? IIF(JEAN,'SI','NO')
		STORE CASOS+1 TO CASOS
	ENDSCAN
	=FIN_LNS(2,CASOS)
	=RELEWIN('WIN')
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
