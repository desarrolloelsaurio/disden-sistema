********************************************************************************
*-- Programa: LRESP1.PRG
*-- Fecha   : 12/08/92
*-- Version : BANALOTTI
*-- Notas   : LISTADO VENTAS DE REMESAS,POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	=win0()
	PAG=1
	=CABPAN()
	STORE 0 TO casos
	acla=paip+padc("FECHA",8)+paip+padc("MERCADERIA",19)+paip+PADC("ENTRADA",10)+paip+PADC("SALIDA",10)+paip+padc("UNITARIO",10)+paip+padc("TOTAL",10)+paip
	linea=REPL("=",LEN(acla))
	naprove=pro.procod
	naproved=pro.proveedor
	tt='Remesa '+alltrim(str(naremes))+" del Proveedor: "+alltrim(naproved)+'  Fecha:'+dtoc(rem.fechaop)
	=tit_lin(1)
	sele KAR
	ttl=0
	ttu=0
	SCAN for &fisc
		IF ROW()=21
			? LINEA
			? PADL('SUBTOTAL '+STR(TTU,10,2)+SPACE(12)+STR(TTL,10,2)+'   ',78)
			=FIN_LIN(1,nul)
			IF LASTKEY()=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lin(1)
		ENDIF
		?paip
		SELE mer
		?? KAR.FECHAOP
		?? PAIP
		?? iif(seek(ALLTRIM(KAR.ARTICULO)),left(mer.palpopup,19),"Mercad. Inexistente")
		?? paip
		SELE KAR
		?? KAR.entrada picture '999999.999'
		?? paip
		?? kar.salida picture '999999.999'
		?? paip
		?? kar.unitario picture '9999999.99'
		?? paip
		?? kar.unitario*kar.salida picture '9999999.99'
		?? paip
		ttl=ttl+kar.unitario*kar.salida
		ttu=ttu+kar.salida
	ENDSCAN
	? LINEA
	? PADL('   TOTAL '+STR(TTU,10,2)+SPACE(12)+STR(TTL,10,2)+'   ',78)
	NADA=IIF(TTU=0,0,TTL/TTU)
	NADA=ROUND(NADA,2)
	? PADL('PROMEDIO '+SPACE(22)+STR(NADA,10,2)+'   ',78)
	=FIN_LIN(2,nul)
	=RELEWIN('win')
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
