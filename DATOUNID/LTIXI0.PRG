********************************************************************************
*-- Programa: LtiXI0.PRG
*-- Fecha   : 01-22-92 05:21pm
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE % part. POR IMPRESORA
*-- Modificaci¢n GOYO 05-30-92 11:13am (Impresor-imprimiendo-iaud)
********************************************************************************
para consuma
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE tiX
	=MEN_LIN(IMPRIMIENDO)
	STORE nul TO casos, totalporc
	acla=paip+PADC(iif(tipolis>1,"TIPO UNIDAD","TIPO GASTO"),20)+paip+PADC("PORC.",6)+'|FECHA IN|  USUARIO |'
	lns=REPL("=",LEN(acla))
	STORE LEN(acla) TO largo
	tt=ttu
	STORE MIN(xacancho,xachoja) TO largoim
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=tit_lns(3)
	SCAN FOR &fisc
		IF _PLINENO>63
			=FIN_LNS(3,0)
			=cabpri1()
			=tit_lns(4)
		ENDI
		? paip
		?? iif(tipolis>1,SAYMIX(TIX.UNICOD,"TIPCOD"),SAYMIX(TIX.GASCOD,'GASCOD'))
		?? paip
		?? TRANS(TIX.PORCENTAJE,"999.99")
		?? paip
		SELE TIX
		=impuse()
		store totalporc+tix.porcentaje to totalporc
	ENDSCAN
	? lns
	_WRAP=.F.
	?
	? "Cantidad de Casos:"
	?? STR(casos,10)
	?
	?iif(tipolis=3,"Suma Total:"+tran(totalporc, "999.99 % ")+iif(totalporc=100, '', ' ... ERROR !!'), '')
	EJECT PAGE
	?
	ENDP
	=finimp()
	=iaud(FISC)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
