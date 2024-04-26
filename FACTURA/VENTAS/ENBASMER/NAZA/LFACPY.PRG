**********************************************************************
*-- Programa: LFACPY.PRG
*-- Fecha   : 06-02-92 04:17am
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE MERCADERIA VENDIDA
**********************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
HAYMERCA=HAYCAMPO("MERCA","MER")
	CCS=GENTMP()
	=LFACPO(CCS)
	SELE LIS
	stor nul TO casos,TC,TP
	acla=paip+padc("ARTICULO",iif(filart=1,16,iif(filart=2,13,iif(filart=3,10,6))))+PAIP+PADC("DESCRIPCION",30)+PAIP+PADC("CANTIDAD",10)+PAIP+PADC("MONTO",14)+PAIP
	LINEA=REPL("=",LEN(ACLA))
	pag=1
	TT='Ranking de Productos'+CHR(10)+chr(13)+tt
	=UNWORK()
	=win0()
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,PAIP+PADR("SUBTOTAL",10)+PAIP+SPACE(30)+paip+STR(TC,10)+PAIP+STR(TP,14,2)+PAIP)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LFACPY1()
	ENDSCAN
	=FIN_LIN(2,CASOS,PAIP+PADR("TOTAL",10)+PAIP+SPACE(30)+paip+STR(TC,10)+PAIP+STR(TP,14,2)+PAIP)
	=RELEWIN("win")
	=REOPFAC()
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
