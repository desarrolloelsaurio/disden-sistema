***************************************************************
*-- Programa: LFACIA.PRG
*-- Fecha   : 07/22/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - inscriptos
*-- MODIFICACION GOYO / NOVOGAR
***************************************************************
PARAMETER COSA,conremi,NCR,L_REMITO,THE_FACTURA,THE_REMITO
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
HAYPARTIDA=HAYCAMPO("PARTIDA","MER")
STORE .F. TO M.ESREMITO
IF !EMPTY(THE_REMITO)
	STORE .T. TO M.ESREMITO
	SELE REM
	THE_FACTURA=THE_REMITO
	SET ORDER TO TAG REMITO
	THE_ALIAS="REM"
	THE_ALIAS1="FAX"
	THE_ORDER="REMITO"
ELSE
	SELE FAC
	THE_FACTURA=IIF(EMPTY(THE_FACTURA),FAC.FACTURA,THE_FACTURA)
	SET ORDER TO TAG FACTURA
	THE_ALIAS="FAC"
	THE_ALIAS1="FAX"
	THE_ORDER="FACTURA"
ENDIF
IF XSEEK(THE_FACTURA,THE_ALIAS,THE_ORDER)
	SELE FAX
	=XSEEK(THE_FACTURA,"FAX",THE_ORDER)
	picu="99,999,999,999.99"
	picu1="999,999.99"
	W=PAIP
	=impresor()
	STOR NUL TO casos
	stor 90 TO t1
	c1=2
	c2=18
	c7=48
	c3=60
	c4=c3+10
	c5=55
	c6=60
	L_BIENUSO=IIF(TYPE("FAC.BIENDEUSO")="U",.F.,FAC.BIENDEUSO)
	STORE "" TO NLQ1,NLQ2
	STORE .T. TO LPT1
	=CABPRI3(1,48)
	PRINTJOB
	***************************************************
	IF NCR
		?
		?? CHR(14)
		?? 'N.CRED.' AT 32
	ELSE
		?
	ENDIF
	?
	?? nlq2
	if esremito
	? rem.fechaem AT 60	
	else
	? fac.fechaem AT 60
	endif
	?
	?
	?
	?
	=XSEEK(IIF(ESREMITO,PER.CODCLI,FAC.CODCLI),"PER","CODCLI")
	?
	?? nlq1
	?? PADR(alltrim(PER.codcli),25)
	?? nlq2
	?? ALLTRIM(SAYMIX(PER.CONDIVA,"IVACOD")) AT 40
	?? PER.NROIVA AT 62

	?
	?? nlq1
	?? PER.CLIENTE
	?
	?? nlq1
	?? PER.domicilio
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")"
	=XSEEK(right(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '
	?? alltrim(mix.texto1)
	?? space(5)
	?? nlq2
	=XSEEK(IIF(ESREMITO,REM.condpago,fac.condpago),'MIX','PAGCOD')
	stor mix.texto1 TO nada,nada2
	?? NADA AT 40
	if conremi
		?? L_REMITO AT 62
	endif
	?
	?
	?
	?? nlq2
	SELE fac
	stor 1 TO I
	FOR A=4 TO 16 STEP 3
		stor VAL(SUBSTR(nada2,A,3)) TO nada5
		IF EMPTY(nada5)
			EXIT
		endi
		stor I+1 TO I
	NEXT
	sele fax
	set order to tag (THE_ORDER)
	IF ESREMITO
		=seek(REM.REMITO)
	ELSE
		=seek(fac.factura)
	ENDIF
	stor RECNO() TO regi
	STOR NUL TO nadacan,nadacanu,nadareg
	stor .T. TO lnada10
	stor .F. TO lnada12
	STOR NUL TO nadacant

	SCAN whil (fax.factura=fac.factura) .OR. ;
			(ESREMITO .AND. fax.REMITO=REM.REMITO)
		=XSEEK(FAX.ARTICULO,'MER','ARTICULO')
		? substr(mer.articulo,9)
		?? '  '
		?? STR(FAX.CANTIDAD,4)
		?? ' '
		?? chr(15)
		?? mer.merca
		?? '-'
		?? chr(18)
		?? SAYMIX1(MER.MARCA,"MARCOD")
		nadacant=nadacant+FAX.CANTIDAD
		?? ' '
		?? STR(FAX.GRAVADO,9,2)
		?? RETMON()
		?? STR(FAX.GRAVADO*FAX.CANTIDAD,9,2)
		if haypartida .and. !empty(mer.partida)
			? space(21)
			?? chr(15)
			?? mer.PARTIDA
			?? chr(18)
			?? space(10)
		endif
		IF L_BIENUSO
			? space(21)
			?? chr(15)
			?? PADC(" Bien de uso ",len(mer.PARTIDA),"*")
			?? chr(18)
			?? space(10)
		ENDIF
	ENDS
	IF !ESREMITO
		IF !EMPTY(FAC.DESCUENTO)
			? 'DESCUENTO'
			?? 0-FAC.descuento PICT PICU AT 61
		ENDIF
	ENDIF
	DO WHILE _PLINENO<32
		?
	ENDDO
	IF ESREMITO
		=XSEEK(REM.CODVIA,'VIA','CODVIA')

		?
	ELSE
		=XSEEK(FAC.CODVIA,'VIA','CODVIA')
		? PADR(UPPER(BIAJA),19)+': '+ALLTRIM(VIA.VIAJANTE) AT 2
		?
		?
		? FAC.MONTOBRU PICT PICU1
		?? FAC.MONTOIVA PICT PICU1 AT 38
		?? FAC.MONTOOT2 PICT PICU1 AT 49
		?? FAC.IMPINT PICT PICU1 AT 27
		?? "  " at c6-2
		?? FAC.MONTONET PICT PICU
	ENDIF
	?
	? 'Cantidad de Art¡culos:'
	?? alltrim(str(nadacant))
	IF !ESREMITO
		if fac.moneda=left(xauss,1)
			tx='EQ. '+UPPER(XADOLS)
			TX=PADR(TX,11)+" : "
			? tx
			?? '->'
			?? fac.montonet/FAC.COTIZ pict PICU
			?? ' '
			?? XADOLS
		endif
	ENDIF
	_WRAP=.F.
	_lmargin=NUL
	?
	IF !ESREMITO
		=L_CUOT()
	ENDIF
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(THE_FACTURA)
ELSE
	=WNCL("FACTURA "+THE_FACTURA+" NO ENCONTRADA")
ENDIF
RETURN MEN_LIN(BOTOM)
