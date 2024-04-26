********************************************************************************
*-- Programa: LPLAP1.PRG
*-- Fecha   : 01/02/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE PLANILLA,POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO WIN0
	PAG=1
	DO CABPAN
	STORE 0 TO cantotal,pretotal
	acla=PAIP+padc(upper(biaja),11)+PAIP+PADC("CLIENTE",15)+PAIP+PADC("CANTIDAD",12)+PAIP+PADC("PRECIO UNITA.",12)+PAIP+PADC("PRECIO TOTAL",14)+'|  FECHA |'
	lineas=REPL("=",LEN(acla))
	tt='Listado de la Planilla '
	_WRAP=.f.
	_ALIGNMENT='CENTER'
	? tt
	? lineas
	? acla
	? lineas
	_WRAP=.f.
	sele pla
	SCAN FOR &fisc
		IF ROW()=21
			? LEFT(lineas,LEN(lineas)-4)
			?? '\\\\'
			IF INKEY(0)=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			DO CABPAN
			? tt
			? lineas
			? acla
			? lineas
		ENDIF
		?PAIP
		SELE via
		?? iif(seek(pla.codvia),left(via.viajante,11),padr("NO existe",11))
		??PAIP
		SELE PER
		set order to 2
		?? iif(seek(pla.cliente),left(PER.cliente,15),PADL("NO existe",15))
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
		?? PAIP
		?? pla.fecha
		?? PAIP
	ENDSCAN
	? lineas
	? " Totales:"+space(19)+PAIP+str(cantotal,12,2)+PAIP+space(12)+PAIP+str(pretotal,14,2)+PAIP
	? lineas
	? " Promedio: "+alltrim(str(pretotal/cantotal,14,2))
	? lineas
	_WRAP=.F.
	=INKEY(0,'HM')
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
*: EOF: LPLAP1.PRG
