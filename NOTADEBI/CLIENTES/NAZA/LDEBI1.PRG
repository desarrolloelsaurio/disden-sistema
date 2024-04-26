********************************************************************************
*-- Programa: LDEBI1.PRG
*-- Fecha   : 09/27/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE NOTAS DE DEBITO, POR IMPRESORA
*-- Modificaci¢n GOYO 06-25-92 02:40pm (adapt lcrei1 a ldebi1)
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	SELE fac
	DO impresor
	=men_lin(IMPRIMIENDO)
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
	? fac->fechaem AT 60
	?
	?
	?
	?
	=XSEEK(fac->codcli,'PER','CODCLI')
	? PER.cliente+" ("+alltrim(fac->codcli)+")" AT 15
	? PER.domicilio at 15
	=XSEEK(PER.localidad,'MIX','CIUCOD')
	STORE mix->texto1 TO nada
	? alltrim(mix->texto1)+" ("+alltrim(str(MIX->nu2))+")" at 15
	=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '
	?? alltrim(mix->texto1)
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 15
	?? PER.NROIVA AT 50
	?
	**/   SELE via
	*     SEEK fac->codvia
	*     ?? 'VIAJANTE           : '+ALLTRIM(via->viajante) AT T1
	?
	?
	?
	?
	?
	?
	? "     Nota de D‚bito de la FACTURA : "
	SELE ccl
	IF XSEEK(FAC.FACTURA,'CCL','NUMERORE')
		?? SUCU
		?? '-'
		ddd=rat(" ",ccl->compr)
		IF EMPTY(DDD)
			ddd=rat("§",ccl->compr)
			ddd=val(substr(ccl->compr,ddd+1))
		ELSE
			ddd=val(substr(ccl->compr,ddd+1))
		ENDIF
		DDD=XXTONUM(DDD)
		?? ZERO(ddd,8)
		IF !EMPTY(ccl->detalle)
			?  "     en concepto de "
			?? ccl->detalle
		ENDIF
	ENDIF
	SELE fac
	??? CHR(15)
	DO WHILE _PLINENO<54
		?
	ENDDO
	? Fac->montobru pict PICU AT c6
	?? RETMON()
	?
	?
	FOR A=1 TO 3
		IF !EMPTY(xaci[A])
			IF xaciva[PER.condiva,A*2]#0
				nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6,2))
				? NNX2+"% " AT 111
				IF A=1
					?? fac->montoiva pict PICU AT c6
				ELSE
					IF A=2
						?? fac->montoot2 pict PICU AT c6
					ELSE
						?? fac->montoot3 pict PICU AT c6
					endi
				endi
				??" $ "
			ELSE
				?
			endi
		ENDIF
		endf
		? fac->montonet pict PICU AT c6
		?? RETMON()
		if fac->moneda=left(xauss,1)
			tx='EQ. '+UPPER(XADOLS)
			TX=PADR(TX,11)+" : "
			?
			? TX AT 105
			?? fac->montonet/FAC->COTIZ pict PICU AT c6
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
		=iaud('NOTA DEBITO '+ALLTRIM(STR(FACTURA))+' por IMPRESORA')
	else
		=iaudi()
	endi
	=MEN_LIN(BOTOM)
RETURN
