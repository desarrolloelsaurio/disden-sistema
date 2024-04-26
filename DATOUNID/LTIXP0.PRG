*************************************************************
*-- Programa: LTIXP0.PRG
*-- Fecha   : 01-22-92 05:19pm
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE procentaje de particip POR PANTALLA
*************************************************************
parameter defivent
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE TIX
	if !defivent
		=WIN0()
	else
		acti wind win
		clea
	endif
	pag=1
	=cabpan()
	STORE nul TO casos, totalporc
	acla=paip+PADC(iif(tipolis>1,"TIPO UNIDAD","TIPO GASTO"),20)+paip+PADC("PORC.",6)+'|FECHA IN|  USUARIO |'
	linea=REPL("=",LEN(acla))
	tt=ttu
	=tit_lin(1)
	SCAN FOR &fisc
		IF ROW()=21
			if !fin_lin(1,0)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		? paip
		?? iif(tipolis>1,SAYMIX(TIX.UNICOD,"TIPCOD"),SAYMIX(TIX.GASCOD,'GASCOD'))
		?? paip
		?? TRANS(TIX.PORCENTAJE,"999.99")
		=impuse()
		SELE TIX
		store totalporc+tix.porcentaje to totalporc
	ENDSCAN
	? linea
	_WRAP=.F.
	? "Cantidad de Casos:"
	?? STR(casos,10)
	?
	?iif(tipolis=3,"Suma Total:"+tran(totalporc, "999.99 % ")+iif(totalporc=100, '', ' ... ERROR !!'), '')
	=INKEY(NUL,"HM")
	=iaud(fisc)
	if defivent
		clea
	endif
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
