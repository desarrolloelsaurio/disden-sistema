********************************************************************************
*-- Programa: LMERIM.PRG
*-- Fecha   : 03-27-92 01:58am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE MERCADERIA, CON DESCRIPCION GLOBAL, POR IMPRESORA
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	=WORKING()
	SET ORDER TO CODRUB IN RUB
	SELE mer
	SET ORDER TO TAG ARTICULO
	SET RELA TO RUBRO INTO RUB
	=LMERO(GENTMP())
	=MEN_LIN(IMPRIMIENDO)
	STOR NUL TO casos
	STORE MIN(xacancho,xachoja) TO largoim
	STORE PAIP+PADC("RUBRO",20)+PAIP+'CRUB'+PAIP+PADC("ARTICULO",20)+PAIP+PADC("MERCADERIA",30)+PAIP TO Acla
	lg=IIF(largoim=80,pds[1],pds[2])
	largor=lg-LEN(acla)-3
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO largo
	STORE 'Listado de Mercader¡a' TO tt
	=UNWORK()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LNS(3)
	SCAN FOR &fisc
		IF _PLINENO>63
			=FIN_LNS(3,nul)
			=cabpri1()
			=TIT_LNS(4)
		ENDI
		? PAIP
		?? RUB.RUBRO
		?? PAIP
		?? ZERO(RUBRO,4)
		?? PAIP
		?? ARTICULO
		?? PAIP
		?? MERCA
		?? PAIP
		STORE casos+1 TO casos
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
	SELE MER
	SET ORDER TO
ELSE
	=IAUDi()
ENDIF
RETURN MEN_LIN(BOTOM)
