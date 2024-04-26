********************************************************************************
*-- Programa: LRESI3.PRG
*-- Fecha   : 12/08/92
*-- Version : BANALOTTI
*-- Notas   : LISTADO VENTAS DE REMESAS,POR IMPRESORA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR NUL TO casos,ttl,ttu
	naprove=pro.procod
	naproved=pro.proveedor
	acla=paip+padc("FECHA",8)+paip+padc("MERCADERIA",19)+paip+PADC("ENTRADA",10)+paip+PADC("SALIDA",10)+paip+padc("UNITARIO",10)+paip+padc("TOTAL",10)+paip
	linea=REPL("=",LEN(acla))
	tt='Remesa '+alltrim(str(naremes))+" del Proveedor: "+alltrim(naproved)+'  Fecha:'+dtoc(rem.fechaop)
	=MEN_LIN(IMPRIMIENDO)
	=CABPRI()
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE KAR
	SCAN for &fisc
		IF _PLINENO>63
			? LINEA
			? PADL('SUBTOTAL '+STR(TTU,10,2)+SPACE(12)+STR(TTL,10,2)+'   ',78)
			=FIN_LIN(3,NUL)
			=Cabpri1()
			=TIT_LIN(4)
			STOR pag+1 TO pag
			=CABPRI()
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
	=FIN_LIN(4,nul)
	ENDPRI
	=FINIMP()
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
