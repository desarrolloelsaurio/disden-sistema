********************************************************************************
*-- Programa: LFACIY.PRG
*-- Fecha   : 06-02-92 04:26am
*-- Version : G. REINER
*-- Notas   : LISTADO DE MERCADERIA VENDIDA
*-- Modificaci¢n GOYO 07-01-92 07:28pm / adaptaci¢n Listado LFACPO
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
HAYMERCA=HAYCAMPO("MERCA","MER")
	=MEN_LIN("ESPERE POR FAVOR")
	=working()
	CCS=GENTMP()
	=LFACPO(CCS)
	SELE LIS
	stor nul TO casos,TC,TP
	largoart=iif(filart=1,16,iif(filart=2,13,iif(filart=3,10,6)))
	acla=paip+padc("ARTICULO",largoart)+PAIP+PADC("DESCRIPCION",30)+PAIP+PADC("CANTIDAD",10)+PAIP+PADC("MONTO",14)+PAIP
	LINEA=REPL("=",LEN(ACLA))
	pag=1
	TT='Ranking de Productos'+CHR(10)+chr(13)+tt
	=UNWORK()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,PAIP+PADR("SUBTOTAL",largoart)+PAIP+SPACE(30)+paip+STR(TC,10)+PAIP+STR(TP,14,2)+PAIP)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LFACPY1()
	ENDSCAN
	=FIN_LIN(4,CASOS,PAIP+PADR("TOTAL",largoart)+PAIP+SPACE(30)+paip+STR(TC,10)+PAIP+STR(TP,14,2)+PAIP)
	ENDP
	=FINIMP()
	=iaud(FISC)
	=REOPFAC()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
