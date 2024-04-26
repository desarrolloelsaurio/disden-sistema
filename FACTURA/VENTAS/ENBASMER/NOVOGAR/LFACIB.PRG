******************************************************************************
*-- Programa: LFACIB.PRG
*-- Fecha   : 10-14-92 11:47am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA - TIPO B
*-- MODIFICACION GOYO / NOVOGAR
********************************************************************************
PARAMETER COSA,conremi,NCR,L_REMITO
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	haypartida=haycampo("partida","mer")
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
	IF RIGHT(CODCLI,7)="CONTADO"
	   =OPCLITXT()
  	   if !XSEEK(FAC.FACTURA,"CLITXT","FACTURA")
		   SALIDA=CLI_TXT(PATH+'\A'+righT(FAC.FACTURA,7)+'.TMP')
  		   =RELEWIN("CLITXT")
	   endif
	   SELE CLITXT
	   SCAT MEMV
	ENDIF
	STORE .T. TO LPT1
	=cabpri3(2,36)
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
	? fac.fechaem AT 60
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	?
	?? nlq1
	IF RIGHT(CODCLI,7)='CONTADO' .OR. LEFT(PER.CLIENTE,7)='TARJETA'
		salida=.t.
		IF XSEEK(FAC.FACTURA,"CLITXT","FACTURA")
		    SELE CLITXT
			SCAT MEMV
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
		?
		? 'CONSUMIDOR FINAL' AT 10
	ELSE
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
		?
		?? ALLTRIM(SAYMIX(PER.CONDIVA,"IVACOD")) AT 10
		?? PER.NROIVA AT 61
	ENDIF
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada,nada2
	? NADA AT 10
	if conremi
		?? L_REMITO AT 61
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
	Set order to tag facturab
	=seek(fac.factura)
	stor RECNO() TO regi
	STOR NUL TO nadacan,nadacanu,nadareg
	stor .T. TO lnada10
	stor .F. TO lnada12
	STOR NUL TO nadacant
	SCAN whil fax.factura=fac.factura
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
		?? STR(montouni,9,2)
		?? RETMON()
		?? STR(FAX.MONTOUNI*FAX.CANTIDAD,9,2)
		if haypartida .and. !empty(mer.partida)
			? space(21)
			?? chr(15)
			?? mer.partida
			?? chr(18)
			?? space(10)
		endif
	ENDS
	IF !EMPTY(FAC.DESCUENTO)
		? 'DESCUENTO'
		?? 0-FAC.descuento PICT PICU AT 61
	ENDIF
	DO WHILE _PLINENO<24
		?
	ENDDO
	=xseek(fac.codvia,'via','codvia')
	? padr(upper(biaja),19)+': '+ALLTRIM(via.viajante)
	? 'Cantidad de Art¡culos:'
	?? alltrim(str(nadacant))
	?
	? RETMON() AT 59
	?? FAC.MONTONET PICT PICU AT 61
	=l_cuot()
	?
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FAC.FACTURA)
ELSE
	=IAUDI()
ENDI
RETURN MEN_LIN(BOTOM)
