******************************************************************************
*-- Programa: LCREI1L.PRG
*-- Fecha   : 05-22-92 01:48am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE NOTAS DE CREDITO
********************************************************************************
PARAMETER COSA,conremi
PRIVATE COSA,conremi
ulpr=hora_ulp(program())
IF cheqseg()
	SELE fac
	picu="99,999,999,999.99"
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
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	_PEJECT="NONE"
	_PLENGTH=72
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{72}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}{27}{69}'
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
	wrap=.F.
	_rmargin=255
	_lmargin=NUL
	_PCOPIES=3
	PRINTJOB
	***************************************************
	?
	??? chr(14)
	?? 'N. CRED' AT 23
	?
	? fac.fechaem AT 60
	?
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	? PER.cliente AT 8
	?? "("+alltrim(fac.codcli)+")" AT 55
	? PER.domicilio at 8
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 8
	=XSEEK(LEFT(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '
	?? alltrim(mix.texto1)
	?
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 15
	?? PER.NROIVA AT 55
	?
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2
	? NADA AT 17
	SELE fac
	?
	?
	?
	?
	IF XSEEK(FAC.FACTURA,'CCL','NUMERORE')
		? "NOTA DE CREDITO CORRESPONDIENTE A LA FACTURA "
		?? SUCU+"-"
		NUFA=VAL(SUBSTR(CCL.COMPR,AT('§',CCL.COMPR)+1))
		NUFA=ZERO(NUFA,8)
		?? NUFA
		?
		? "EN CONCEPTO DE "
		?? UPPER(CCL.DETALLE)
	ENDIF
	DO WHILE _PLINENO<56
		?
	ENDDO
	?
	IF EMPTY(FAC.DESCUENTO)
		?? Fac.montobru pict PICU AT c6
		?? RETMON()
		?
		?
	ELSE
		?? fac.monto pict PICU AT C6
		?? RETMON()
		?
		? fac.DESCUENTO pict PICU AT c6
		?? RETMON()
		? fac.montobru pict PICU AT c6
		?? RETMON()
	ENDIF
	?
	?
	?
	FOR A=1 TO 3
		if a=1
			?
		else
			if a=2
				if fac.moneda=left(xauss,1)
					tx='EQ. '+UPPER(XADOLS)
					TX=PADR(TX,11)+" : "
					?
					? TX AT 5
					?? '.'
					?? fac.montonet/FAC.COTIZ pict PICU
					?? ' '
					?? LEFT(xadols,3)
				else
					?
				endif
			endif
		endif
		IF !EMPTY(xaci[A])
			IF xaciva[PER.condiva,A*2]#0 .AND. xaciva[PER.condiva,A*2+1]="SI"
				nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6,2))
				IF A=1
					?? NNX2+"% " AT c5
					?? fac.montoiva pict PICU AT c6
				ELSE
					IF A=2
						?? NNX2+"% " AT c5
						?? fac.montoot2 pict PICU AT c6
					ELSE
						? NNX2+"% " AT c5
						?? fac.montoot3 pict PICU AT c6
					endi
				endi
				??" $ "
				stor J+1 TO J
			endi
		ELSE
			?
		endi
	next
	? FAC.MONTONET PICT PICU AT C6
	?? " $"
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	ENDP
	=FINIMP()
	IF COSA
		=iaud(STR(fax.FACTURA))
	ELSE
		=iaud('REIMPRIME '+ALLTRIM(STR(FAC.FACTURA)))
	ENDIF
else
	=iaudi()
endi
=MEN_LIN(BOTOM)
RETURN
