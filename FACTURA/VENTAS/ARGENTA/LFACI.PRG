***************************************************************************
*-- Programa: LFACI.PRG
*-- Fecha   : 09/28/92
*-- Version : BANALOTTI
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
********************************************************************************
PARAMETER cosas
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
 IF XSEEK(FAC.FACTURA,'FAX','factura')
	SELE fac
	picu="99,999,999,999.99"
	W=PAIP
	=impresor()
	STOR NUL TO casos
	c1=2
	c2=18
	c7=48
	c3=c7+2
	c4=c3+10
	c5=c4
	c6=c5+20
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	_PEJECT="NONE"
	_RMARGIN=80
	_PLINENO=NUL
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{36}{27}{120}{0}{18}{27}{116}{1}{27}{82}{0}'
	_PLENGTH=36
	_RMARGIN=80
	_PLOFFSET=NUL
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
	***
	_PCOPIES=1
	PRINTJOB
	WRAP=.T.
	_ALIGNMENT="RIGHT"
	_RMARGIN=132
****
	?
	?
	??? chr(14)
	IF NCR
		?? 'N.CRED.' AT 28
	ELSE
		?? 'FACTURA' AT 28
	ENDIF
	?
	?
	?
	? fac.fechaem AT 60
	?
	?
	?
	?
	=XSEEK(FAC.CODCLI,'PER','CODCLI')
	? PER.cliente+" ("+alltrim(fac.codcli)+")" AT 15
	? PER.domicilio at 15
	=xseek(PER.localidad,'mix','ciucod')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 15
	=xseek(right(mix.texto2,2),'mix','prvtex')
	?? ' - '
	?? alltrim(mix.texto1)
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 15
	?? PER.NROIVA AT 50
	?
	=xseek(fac.condpago,'mix','pagcod')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
	stor mix.texto1 TO nada2
	? NADA AT 17
	IF XSEEK(FAC.CODVIA,'VIA','CODVIA')
      ?? 'VIAJANTE           : '+ALLTRIM(via.viajante) AT 15
    ENDIF
	SELE fac
	STOR 1 TO i
	FOR A=4 TO 16 STEP 3
		STOR VAL(SUBSTR(nada2,A,3)) TO nada5
		IF EMPTY(nada5)
			EXIT
		ENDI
		STOR i+1 TO i
	NEXT
	DIME fec[7]
	STOR 1 TO j
	STOR i*3 TO i
	FOR A=1 TO i STEP 3
		STOR fac.fechaem TO fnada
		STOR VAL(SUBSTR(nada2,A,3)) TO nada6
		STOR nada6+fnada TO fnada
		IF EMPTY(VAL(SUBSTR(nada2,A,3))) .AND. i=3
			STOR NUL TO fec[1]
			STOR DTOC(fnada) TO fec[2]
			EXIT
		ELSE
			STOR DTOC(fnada) TO fec[J+1]
		ENDI
		STOR j TO fec[1]
		STOR j+1 TO j
	NEXT
	 =XSEEK(FAC.FACTURA,'FAX','factura')
	?
	?
	STOR RECNO() TO REGI
	SELE FAX
	SCAN WHIL fax.factura=fac.factura
		IF XSEEK(ALLTRIM(FAX.ARTICULO),'MER','ARTICULO')
			?  mer.PALPOPUP
			?? ' '
			?? STR(FAX.CANTIDAD,7)
			?? TRANSF(FAX.MONTO,"999,999,999.99")
			?? ' '
			?? TRANSF(FAX.MONTO*FAX.CANTIDAD,"999,999,999.99")
		ENDIF
		SELE FAX
	endscan
	if !empty(fac.descuento)
		? CHR(15)
		?? space(19)
		?? chr(18)
		?? padr('DESCUENTO',28)
		?? space(24)
		?? TRANSF(0-FAC.DESCUENTO,"999,999,999.99")
	endif
	DO WHILE _PLINENO<28
		?
	ENDDO
	? fac.montobru PICT picu AT 60
	?? LEFT(IIF(SUBSTR(xauss,1,1)=fac.moneda,' $ ','u$s'),3)
	IF !EMPTY(FAC.MONTOIVA)
    	? fac.montoiva PICT picu AT 60
	    ?? LEFT(IIF(SUBSTR(xauss,1,1)=fac.moneda,' $ ','u$s'),3)
	ENDIF
	IF !EMPTY(FAC.MONTOOT2)
    	? fac.montoot2 PICT picu AT 60
	    ?? LEFT(IIF(SUBSTR(xauss,1,1)=fac.moneda,' $ ','u$s'),3)
	ENDIF
	IF !EMPTY(FAC.MONTOEXE)
    	? fac.montoexe PICT picu AT 60
	    ?? LEFT(IIF(SUBSTR(xauss,1,1)=fac.moneda,' $ ','u$s'),3)
	ENDIF
	? fac.montonet PICT picu AT 60
	?? LEFT(IIF(SUBSTR(xauss,1,1)=fac.moneda,' $ ','u$s'),3)
	_WRAP=.F.
	EJECT PAGE
	ENDP
	=finimp()
	IF COSAS
		=IAUD(STR(FAC.FACTURA))
	ENDIF
  ENDIF
ELSE
	=iaudi()
ENDI
RETURN
