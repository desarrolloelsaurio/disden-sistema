********************************************************************************
*-- Programa: LPLAI2.PRG
*-- Fecha   : 12/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE PLANILLA, POR IMPRESORA
********************************************************************************
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	=impresor()
	acla=PAIP+padc("CLIENTE",20)+PAIP+PADC("MERCADERIA",40)+PAIP+PADC("CANTIDAD",12)+PAIP+PADC("PRECIO UNITA.",12)+PAIP+PADC("PRECIO TOTAL",14)+'|  FECHA |  USUARIO |'
	STORE REPL("=",LEN(acla)) TO lns
	STORE NUL TO casos,cantotal,pretotal
	STORE LEN(acla) TO largo
	STORE MIN(xacancho,xachoja) TO largoim
	mxrn=66
=MEN_LIN(IMPRIMIENDO)
	IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
		A=LEFT(sincosas(janname),8)+'.TXT'
		ACTI SCRE
		=MEN_LIN("Imprimiendo Listado en Archivo "+ALLTRIM(A))
		SET PRINTER TO (A)
		mxrn=IIF(largoim>80,50,48)
	ENDIF
	tt='Listado de la Planilla'
	DO CABPRI
	_PCOPIES=1
	sele pla
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	SCAN FOR &fisc
		IF _PLINENO>63
			? LEFT(lns,largoim-3)
			?? '                                       ///'
			EJECT PAGE
			_RMARGIN=80
			_WRAP=.F.
			?
			=CABPRI1()
			=TIT_LNS(4)
		ENDI
		?PAIP
		SELE PER
		set order to 2
		?? iif(seek(pla.cliente),left(PER.cliente,20),PADL("NO existe",20))
		?? PAIP
		SELE mer
		?? iif(seek(pla.merca),left(mer.palpopup,40),padl("Mercader¡a Inexistente",40))
		?? PAIP
		sele pla
		?? pla.cantidad
		cantotal=cantotal+pla.cantidad
		?? PAIP
		?? pla.punitario
		?? PAIP
		nada=pla.cantidad*pla.punitario
		?? str(nada,14,2)
		pretotal=pretotal+nada
		DO IMPUSE
	ENDSCAN
	? lns
	? " Totales:"+space(53)+PAIP+str(cantotal,12,2)+PAIP+space(12)+PAIP+str(pretotal,14,2)+PAIP
	? lns
	? " Promedio: "+str(pretotal/cantotal,14,2)
	? lns
	_WRAP=.F.
	?
	EJECT PAGE
	?
	ENDP
	=FINIMP()
	=IAUD(fisc)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
*: EOF: LPLAI2.PRG
