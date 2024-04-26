******************************************************************************
*-- Programa: LDEBIB.PRG
*-- Fecha   : 06-17-93 07:34pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - TIPO B
*-- MODIFICACION GOYO / NOVOGAR
*-- Modificaci¢n desde Factura
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE fac
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
	STORE "" TO NLQ1,NLQ2
	STORE .T. TO LPT1
	=cabpri3(2,36)
	PRINTJOB
	***************************************************
      ?
      ?
      ?? nlq2
      ?? "NOTA DE DEBITO" AT 60
      ? fac.fechaem AT 60
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	?
	?? nlq1
		?? alltrim(PER.cliente) at 10
		?? " ("
		?? alltrim(PER.codcli)
		?? ")"
		?? nlq2
		?
		?? nlq1
		?? PER.domicilio at 10
		=XSEEK(PER.localidad,'mix','CIUCOD')
		STORE mix.texto1 TO nada
		? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 10
		=XSEEK(right(MIX.TEXTO2,2),'MIX','PRVCOD')
		?? ' - '
		?? alltrim(mix.texto1)
		?? nlq2
		?
		? ALLTRIM(SAYMIX(PER.CONDIVA,"IVACOD")) AT 10
		?? PER.NROIVA AT 61
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada,nada2
	? NADA AT 10
	?
	?
	?? nlq2
	?
	=LDEBI0()
	DO WHILE _PLINENO<24
		?
	ENDDO
	=xseek(fac.coDvia,'via','codvia')
	? padr(upper(biaja),19)+': '+ALLTRIM(via.viajante)
	?
	?
	? RETMON() AT 59
	?? FAC.MONTONET PICT PICU AT 61
	?
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud(FAC.FACTURA)
else
	=iaudi()
endi
RETURN MEN_LIN(BOTOM)