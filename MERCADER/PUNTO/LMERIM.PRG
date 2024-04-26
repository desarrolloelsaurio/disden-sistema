********************************************************************************
*-- Programa: LMERIM.PRG
*-- Fecha   : 06/13/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE MERCADERIA, CON DESCRIPCION GLOBAL, POR IMPRESORA
*-- Modificaci¢n GOYO 05-16-92 02:08am
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE MER
	STORE NUL TO CASOS
	STORE MIN(XACANCHO,XACHOJA) TO LARGOIM
	STORE PAIP+PADC("ARTICULO",15)+PAIP+PADC("MERCADERIA",30)+PAIP+PADC("MARCA",20)+PAIP TO acla
	lg=IIF(largoim=80,pds[1],pds[2])
	largor=lg-LEN(acla)-3
	acla=acla+PADC("DESCRIPCION",largor)+PAIP
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO largo
	STORE 'Listado de Mercader¡a' TO tt
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=fin_lns(3,nul)
			=CABPRI1()
			=tit_lns(3)
		ENDI
		? PAIP
		?? PADL(articulo,15)
		?? PAIP
		?? MERCA
		?? PAIP
		?? SAYMIX(mer.marca,'marcod')
		?? PAIP
		?? PADR(CHRTRAN(mer.merca1,CHR(13)+CHR(10),'-'),largor)
		?? PAIP
		STORE CASOS+1 TO CASOS
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
