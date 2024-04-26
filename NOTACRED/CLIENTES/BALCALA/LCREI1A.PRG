******************************************************************************
*-- Programa: LCREI1A.PRG
*-- Fecha   : 05-22-92 01:48am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE NOTAS DE CREDITO
*********************************************************************************
PARAMETER COSA,conremi
privaTE COSA,CONREMI
ulpr=hora_ulp(program())
IF cheqseg()
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
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	_PEJECT="NONE"
	_PLENGTH=51
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{72}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}{27}{69}'
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
	??? chr(14)
	?? "N. CRED." AT 23
	?? "N. CRED." AT 23+32
	?
	?
	?
	? fac->fechaem AT 46
	?? FAC.FECHAEM AT 46+69
	?
	?
	?
	?
	=XSEEK(fac->codcli,'PER','CODCLI')

	? PER.cliente AT 8
	?? "("+alltrim(fac->codcli)+")" AT 46
	?? PER.cliente AT 8+69
	?? "("+alltrim(fac->codcli)+")" AT 46+69


	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix->texto1 TO nada
	STORE MIX.NU2 TO NAD2
	=XSEEK(LEFT(MIX.TEXTO2,2),'MIX','PRVCOD')
	? PER.domicilio at 8
	?? PER.domicilio at 8+69

	? alltrim(NADA)+" ("+alltrim(str(NAD2))+")" at 8
	?? ' - '
	?? alltrim(mix->texto1)
	?? alltrim(NADA)+" ("+alltrim(str(NAD2))+")" at 8+69
	?? ' - '
	?? alltrim(mix->texto1)

	?
	?

	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 11
	?? PER.NROIVA AT 45
	?? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 11+69
	?? PER.NROIVA AT 45+69

	?
	?
	=XSEEK(fac->condpago,'MIX','PAGCOD')
	stor mix->texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix->texto1 TO nada2

	? NADA AT 17
	?? NADA AT 17+69

	SELE fac
	stor 1 TO I
	FOR A=4 TO 16 STEP 3
		stor VAL(SUBSTR(nada2,A,3)) TO nada5
		IF EMPTY(nada5)
			EXIT
		endi
		stor I+1 TO I
		endf
		DIME fec[7]
		stor 1 TO J
		stor I*3 TO I
		FOR A=1 TO I STEP 3
			stor fac->fechaem TO fnada
			stor VAL(SUBSTR(nada2,A,3)) TO nada6
			stor nada6+fnada TO fnada
			IF EMPTY(VAL(SUBSTR(nada2,A,3))) .AND. I=3
				STOR NUL TO fec[1]
				stor DTOC(fnada) TO fec[2]
				EXIT
			ELSE
				stor DTOC(fnada) TO fec[J+1]
			endi
			stor J TO fec[1]
			stor J+1 TO J
			endf
			?
			?
			?
			?
			IF XSEEK(FAC.FACTURA,'CCL','NUMERORE')
				NUFA=VAL(SUBSTR(CCL.COMPR,AT('§',CCL.COMPR)+1))
				NUFA=ZERO(NUFA,8)
				? "NOTA DE CREDITO CORRESPONDIENTE A LA FACTURA "
				?? SUCU+"-"
				?? NUFA
				?? "NOTA DE CREDITO CORRESPONDIENTE A LA FACTURA " AT 69
				?? SUCU+"-"
				?? NUFA
				?
				? "EN CONCEPTO DE "
				?? UPPER(CCL.DETALLE)
				?? "EN CONCEPTO DE " AT 69
				?? UPPER(CCL.DETALLE)
			ENDIF
			DO WHILE _PLINENO<40
				?
			ENDDO

			IF EMPTY(FAC->DESCUENTO)
				?? Fac->montobru pict PICU AT 47
				?? RETMON()
				?? Fac->montobru pict PICU AT 47+69
				?? RETMON()
				?
			ELSE
				?? fac->monto pict PICU AT 47
				?? RETMON()
				?? fac->monto pict PICU AT 47+69
				?? RETMON()
				?
				? fac->DESCUENTO pict PICU AT c6
				?? RETMON()
				?? fac->DESCUENTO pict PICU AT c6+69
				?? RETMON()

				? fac->montobru pict PICU AT c6
				?? RETMON()
				?? fac->montobru pict PICU AT c6+69
				?? RETMON()
			ENDIF
			?
			FOR A=1 TO 3
				IF !EMPTY(xaci[A])
					IF xaciva[PER.condiva,A*2]#0 .AND. xaciva[PER.condiva,A*2+1]="SI"
						nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6))
						IF A=1
							? NNX2 AT 39
							?? NNX2 AT 39+69
						ELSE
							IF A=2
								?? NNX2 AT 39
								?? NNX2 AT 39+69
							ELSE
								?? NNX2 AT 49
								?? NNX2 AT 49+69
							endi
						endi
					endi
				endi
				endf
				FOR A=1 TO 3
					IF !EMPTY(xaci[A])
						IF xaciva[PER.condiva,A*2]#0 .AND. xaciva[PER.condiva,A*2+1]="SI"
							IF A=1
								? fac->montoiva pict PICU1 AT 33
								?? fac->montoiva pict PICU1 AT 33+69
							ELSE
								IF A=2
									?? fac->montoot2 pict PICU1 AT 39
									?? fac->montoot2 pict PICU1 AT 39+69
								ELSE
									?? fac->montoot3 pict PICU1 AT 43
									?? fac->montoot3 pict PICU1 AT 43+69
								endi
							endi
						endi
					endi
					endf
					?? FAC->montonet pict picu at 47
					??" $ "
					?? FAC->montonet pict picu at 47+69
					??" $ "
					_WRAP=.F.
					_lmargin=NUL
					?
					EJECT PAGE
					ENDP
					=FINIMP()
					IF COSA
						=iaud('FACTURA '+ALLTRIM(STR(FACTURA))+' por IMPRESORA')
					ELSE
						=iaud('REIMPRIME FACTURA '+ALLTRIM(STR(FAC->FACTURA)))
					ENDIF
				else
					=iaudi()
				endi
				=MEN_LIN(BOTOM)
			RETURN
