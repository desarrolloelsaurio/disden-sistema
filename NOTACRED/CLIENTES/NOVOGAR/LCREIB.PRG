******************************************************************************
*-- Programa: LCREIB.PRG
*-- Fecha   : 10-14-92 11:47am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - TIPO B
*-- MODIFICACION GOYO / NOVOGAR
*-- ADAPTACION DE FACTURA
********************************************************************************
PARAMETER L_UNO,L_DOS
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE fac
	picu="99,999,999,999.99"
	picu1="999,999.99"
	W=PAIP
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
	if !FILE(PATH+'\A'+right(FAC.FACTURA,7)+'.TMP')
		SALIDA=CLI_TXT(PATH+'\A'+righT(FAC.FACTURA,7)+'.TMP')
		=RELEWIN("CLITXT")
	endif
	=cabpri3(2,36)
	PRINTJOB
	***************************************************
	?
	?? CHR(14)
	?? 'N.CRED.' AT 32
	?
	?? nlq2
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
	IF FAC.CODCLI='CN CONTADO' .OR. LEFT(PER.CLIENTE,7)='TARJETA'
		salida=.t.
		if FILE(PATH+'\A'+right(FAC.FACTURA,7)+'.TMP')
			REST FROM (PATH+'\A'+right(FAC.FACTURA,7)+'.TMP') ADDI
			?? M.CLITXTNA at 10
			?? nlq2
			?
			?? nlq1
			?? M.CLITXTAD at 10
			? M.CLITXTLO at 10
			?? nlq2
			IF PER.CLIENTE='TARJETA'
				? PER.CLIENTE AT 10
				?? '-'
				?? 'N§ '
				?? M.CLITXTNT
			ELSE
				?
			ENDIF
		else
			?
			?
			?
		endif
		? 'CONSUMIDOR FINAL' AT 10
	ELSE
		?? PER.cliente at 10
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
		? SAYMIX(PER.CONDIVA,"IVACOD") AT 10
		?? PER.NROIVA AT 61
	ENDIF
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada,nada2
	? NADA AT 10
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
	Set order to tag facturab
	=seek(fac.factura)
	stor RECNO() TO regi
	STOR NUL TO nadacan,nadacanu,nadareg
	STOR NUL TO nadacant
	=LCREI0()
	?? CHR(18)
	DO WHILE _PLINENO<24
		?
	ENDDO
	=xseek(fac.codvia,'via','codvia')
	? padr(upper(biaja),19)+': '+ALLTRIM(via.viajante)
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
