********************************************************************************
*-- Programa: LDEBI.PRG
*-- Fecha   : 02-07-92 07:02pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE NOTAS DE DEBITO, POR IMPRESORA
********************************************************************************
SELE Seg
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=impresor()
	=MEN_LIN(IMPRIMIENDO)
	STOR NUL TO casos
	STORE 30 TO t1
	store 15 to t2
	c6=116
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	picu="99,999,999,999.99"
	_PEJECT="NONE"
	_PLENGTH=72
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{72}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}'
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
	wrap=.F.
	_rmargin=255
	_lmargin=NUL
	_PCOPIES=1
	PRINTJOB
	***************************************************
	?
	?
	??? chr(14)
	?? 'NOTA DEBITO' AT 28
	?
	?
	?
	? fac.fechaem AT 60
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	? PER.cliente+" ("+alltrim(fac.codcli)+")" AT 15
	? PER.domicilio at 15
	=xseek(PER.localidad,'mix','ciucod')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 15
	=xseek(right(mix.texto2,2),'mix','prvcod')
	?? ' - '
	?? alltrim(mix.texto1)
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 15
	?? PER.NROIVA AT 50
	?
	?
	?
	?
	?
	?
	?
	? "Nota de D‚bito relacionada con la: "
	SELE ccl
	GO TOP
	SCAN whil !(ccl.comprre="ND" .AND. ccl.numerore=fac.factura)
	ends
	IF !EOF() .AND. ccl.comprre="ND" .AND. ccl.numerore=fac.factura
		?? SUCU
		?? '-'
		?? ZERO(ccl.NUMERORE,8)
		IF !EMPTY(ccl.detalle)
			?  "en concepto de "
			?? ccl.detalle
		endi
	endi
	SELE fac
	??? CHR(15)
	DO WHILE _PLINENO<54
		?
	ENDDO
	? Fac.montobru pict PICU AT c6
	?? RETMON()
	IF !EMPTY(FAC.EXENTO)
		? "EXENTO" AT C4
		?? FAC.EXENTO PICT PICU AT C6
	ELSE
		?
	ENDIF
	?
	FOR A=1 TO 3
		IF !EMPTY(xaci[A])
			IF xaciva[PER.condiva,A*2]#0
				nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6,2))
				? NNX2+"% " AT 111
				IF A=1
					?? fac.montoiva pict PICU AT c6
				ELSE
					IF A=2
						?? fac.montoot2 pict PICU AT c6
					ELSE
						?? fac.montoot3 pict PICU AT c6
					endi
				endi
				??" $ "
				stor J+1 TO J
			endi
		ELSE
			?
		endi
	NEXT
	?? fac.montonet pict PICU AT c6
	?? RETMON()
	if fac.moneda=left(xauss,1)
		tx='EQ. '+UPPER(XADOLS)
		TX=PADR(TX,11)+" : "
		?
		? TX AT 105
		?? fac.montonet/FAC.COTIZ pict PICU AT c6
		?? LEFT(xadols,3)
	endif
	_lmargin=5
	?
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	?
	ENDP
	=FINIMP()
	DO iaud WITH ALLTRIM(STR(FACTURA))+' por IMPRESORA'
else
	=iaudi()
endi
=MEN_LIN(BOTOM)
RETURN
