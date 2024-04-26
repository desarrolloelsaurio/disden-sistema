******************************************************************************
*-- Programa: LFACIME.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- MODIFICACION GOYO / LA MARTONA / CLAUDIO BALCALA
*-- Modificaci¢n GOYO 05-22-92 01:50am
*-- Modificaci¢n GOYO 06-09-92 03:22am (adaptacion a N. CRED)
*-- Modificaci¢n GOYO 10-01-92 06:02pm adaptaci¢n a PALADEM
*-- Modificaci¢n GOYO 10-04-92 08:07am agrega descuento
*-- Modificaci¢n GOYO Adaptacion a Gambacurta
********************************************************************************
PARAMETER COSA,conremi,NCRD
PRIVATE COSA,conremi,NCRD
ulpr=hora_ulp(program())
if cheqseg()
	SELE fac
	picu="99,999.99"
	W=PAIP
	DO impresor
	STOR NUL TO casos
	stor 90 TO t1
	c1=2
	c2=18
	c7=48
	c3=60
	c4=c3+10
	c5=55
	c6=67
	=cabpri3P(1)
	PRINTJOB
	***************************************************
	?
	??? chr(14)
	IF NCRD
		?? 'N.CRED.' AT 23
	ELSE
		?? 'FACT' AT 23
	ENDIF
	?
	?
	? fac.fechaem AT 50
	?
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	? PER.cliente
	?? alltrim(fac.codcli) AT 47
	?? ALLTRIM(fac.codvia) AT 60
	=XSEEK(PER.ZONA,'MIX','ZONCOD')
	?? LEFT(MIX.TEXTO1,5) AT 72
	? PER.domicilio
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	? alltrim(mix.texto1)+'-'
	?? alltrim(str(MIX.nu2))+'-'
	=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? alltrim(mix.texto1)
	?
	?
	? ALLTRIM(XACIVA[PER.CONDIVA,1])
	?? " - "
	?? PER.NROIVA
	?
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2
	? NADA
	if conremi
		?? '|' AT 53
		FOR ALX=1 TO ALEN(REMITOS,1)
			IF REMITOS[ALX,3]
				?? ALLTRIM(STR(REMITOS[ALX,1]))
				?? '/'
			ENDI
		NEXT
	endif
	SELE fac
	stor 1 TO I
	FOR A=4 TO 16 STEP 3
		stor VAL(SUBSTR(nada2,A,3)) TO nada5
		IF EMPTY(nada5)
			EXIT
		endi
		stor I+1 TO I
	NEXT
	DIME fec[7]
	stor 1 TO J
	stor I*3 TO I
	FOR A=1 TO I STEP 3
		stor fac.fechaem TO fnada
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
	NEXT
	?
	?
	?
	SELE fax
	=SEEK(FAC.FACTURA)
	stor RECNO() TO regi
	STOR NUL TO nadacan,nadacanu,nadareg
	stor .T. TO lnada10
	stor .F. TO lnada12
	STOR NUL TO nadacant
	SCAN whil fax.factura=fac.factura
		=XSEEK(FAX.ARTICULO,'MER','ARTICULO')
		?
		?? CHR(15)
		?? LEFT(MER.ARTICULO,14)
		?? ' '
		if mer.discrim
		    ?? SPACE(9)
			?? STR(FAX.CANTIDAD,9,2)
		else
			?? STR(FAX.cantidad,8)
			?? space(10)
		endif
		?? '   '
		?? CHR(18)
		?? PADR(mer.merca,20)
		?? " "
		?? STR(FAX.MONTO1,8,2)
		?? " "
		nadacant=nadacant+FAX.CANTIDAD
		?? CHR(15)
		IF MER.DISCRIM
		   ?? STR(FAX.unidades,5)
        ELSE
           ?? SPACE(5)
		ENDIF
		?? CHR(18)
		?? str(fax.monto,9,2)
		porc=100*(1-(fax.monto1/fax.monto))
		?? CHR(15)
		?? "  "
		IF PORC>0
		?? str(porc,5,2)
		ELSE
		?? SPACE(5)
		ENDIF
		?? chr(18)
		?? ' '
		?? STR(FAX.MONTO1*FAX.CANTIDAD,9,2)
	ENDS
	DO WHILE _PLINENO<37
		?
	ENDDO
****
	IF EMPTY(FAC.DESCUENTO)
		? Fac.montobru pict PICU AT c6
		?
		?
	ELSE
		? fac.monto pict PICU AT C6
        ? fac.descuento pict PICU AT C6
		? fac.montobru pict PICU AT c6
	ENDIF
	FOR A=1 TO 3
		IF !EMPTY(xaci[A])
			IF xaciva[PER.condiva,A*2]#0
				nnx2=alltrim(STR(XACIVA[PER.CONDIVA,A*2],6,2))
				? NNX2 AT C6-LEN(NNX2)-2
				IF A=1
					?? fac.montoiva pict PICU AT c6
				ELSE
					IF A=2
						?? fac.montoot2 pict PICU AT c6
					ELSE
						?? fac.montoot3 pict PICU AT c6
					endi
				endi
				stor J+1 TO J
			endi
		ELSE
			?
		endi
	NEXT
	?
	?? fac.montonet pict PICU AT c6
****
	_WRAP=.F.
	_lmargin=NUL
	?

	EJECT PAGE
	ENDP
	=FINIMP()
	IF COSA
		=iaud(IIF(NCRD,'NOTA CREDITO ','FACTURA ')+ALLTRIM(STR(fax.FACTURA))+' por IMPRESORA')
	ELSE
		=iaud('REIMPRIME '+IIF(NCRD,'NOTA CREDITO ','FACTURA ')+ALLTRIM(STR(FAC.FACTURA)))
	ENDIF
else
	=iaudi()
endi
=MEN_LIN(BOTOM)
RETURN
