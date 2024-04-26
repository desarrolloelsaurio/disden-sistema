********************************************************************************
*-- Programa: LMERPM.PRG
*-- Fecha   : 06/13/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE MERCADERIAS, con denominacion comercial,POR PANTALLA
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	SELE MER
	=WIN0()
	PAG=1
	=CABPAN()
   STOR NUL TO CASOS
	ACLA=PADC("ARTICULO",15)+PAIP+PADC("MERCADERIA",61)
	LNS=REPL("=",LEN(ACLA))
	=TIT_LNS(1)
	SCAN
		IF ROW()=21
			IF !FIN_LNs(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			_WRAP=.T.
			=TIT_LNs(2)
		ENDIF
		? PADL(ARTICULO,15)
		?? PAIP
		?? PADR(CHRTRAN(MER.MERCA1,CHR(13)+CHR(10),"-"),61)
		STORE CASOS+1 TO CASOS
	ENDSCAN
	=FIN_LNs(2,CASOS)
	=RELEWIN('WIN')
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
