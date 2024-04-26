***************************************************************************
*-- Programa: LFACB.PRG
*-- Fecha   : 10-03-92 03:12pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
********************************************************************************
PARAMETER cosas,conremi,NCR
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE fac
	picu="99,999,999,999.99"
	W=PAIP
	=impresor()
	STOR NUL TO casos
	STOR 90 TO t1
	STOR ((xatalmax-xatalmin)/xatalstep)+1 TO ccol
	DIME ct(ccol)
	STOR (ccol*xatalan+ccol) TO nadatale
	c1=2
	c2=18
	c7=48
	c3=c7+nadatale+2
	c4=c3+10
	c5=c4
	c6=c5+20
	ON KEY DO abpr
	if usador='GOYO' .OR. USADOR='MANILDO'
		on error
	else
		ON ERROR DO abpr
	endif
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
	?
	?? CHR(14)
	IF NCR
		?? 'N.CRED.' AT 27
	ELSE
		?? 'FACTURA' AT 27
	ENDIF
	?
	?
	?
	? fac.fechaem AT 60
	?
	?
	?
	?
	?
	? iif(cosas,CLNAME,"") at 10
	? iif(cosas,CLADRE,'') at 10
	? iif(cosas,CLLOCA,"") at 10
	? 'CONSUMIDOR FINAL' at 10
	=xseek(fac.condpago,'mix','pagcod')
	STOR mix.texto1 TO nada
	nada=TRANSF(nada,"@R 999-999-999-999-999-999")
	nada=ALLTRIM(STRTRAN(nada,'-000',SPACE(4)))
	STOR mix.texto1 TO nada2
	? nada AT 15
	?
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
	SELE fax
	=SEEK(fac.factura)
	?
	?
	STOR RECNO() TO REGI
	SCAN WHIL fax.factura=fac.factura
		IF XSEEK(LEFT(FAX.ARTICULO,13),'MER','ARTICULO')
			SELE MER
			? CHR(15)
			?? alltrim(FAX.articulo)+ZERO(FAX.TALLE*10,3)
			?? '   '
			?? chr(18)
			?? LEFT(mer.merca,28)
			?? '  '
			?? STR(FAX.CANTIDAD,7)
			?? TRANSF(FAX.MONTO1,"999,999,999.99")
			?? ' '
			?? TRANSF(FAX.MONTO1*FAX.CANTIDAD,"999,999,999.99")
		ENDIF
		SELE FAX
	endscan
	IF COSAS
		if !empty(senia)
			? CHR(15)
			?? space(19)
			?? chr(18)
			?? padr('SE¥A S/Factura N§ '+alltrim(str(senia2)),28)
			?? space(24)
			?? TRANSF(0-senia,"999,999,999.99")
		endif
	ENDIF
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
	? fac.montonet PICT picu AT 60
	?? LEFT(IIF(SUBSTR(xauss,1,1)=fac.moneda,' $ ','u$s'),3)
	IF cosas
		?
		??? chr(15)
		IF !EMPTY(EFECAUS)
			? PADR(XAUSS,20)+':'
			?? STR(EFECAUS,14,2)
		ENDIF
		IF !EMPTY(EFECDOL)
			? PADR(XADOLS,20)+':'
			?? STR(EFECDOL,14,2)
		ENDIF
		IF !EMPTY(TARJETA)
			? PADR('TARJETA',20)+':'
			?? STR(TArjeta,14,2)+' - '
			?? tartar+' - '
			?? 'N§ TARJETA:'+NUTAR
		ENDIF
		FOR X=1 TO 3
			IF !EMPTY(CHEQUE[X,1])
				? PADR(XAUSS,20)+':'
				?? STR(CHEQUE[X,1],14,2)
				?? ' - CHEQUE N§ '
				?? CHEQUE[X,3]
				?? ' - BANCO '
				?? CHEQUE[X,2]
				?? ' - DEPOS.: '
				?? CHEQUE[X,4]
			ENDIF
		NEXT
	ENDIF
	********************
	_WRAP=.F.
	EJECT PAGE
	ENDP
	=Finimp()
	IF COSAS
		=iaud(STR(FAC.FACTURA))
	ENDIF
ELSE
	=iaudi()
ENDI
RETURN
