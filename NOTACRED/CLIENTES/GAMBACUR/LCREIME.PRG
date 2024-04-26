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
*-- Modificaci¢n GOYO Adaptacion a Gambacurta A NOTA DE DEBITOS
********************************************************************************
PARAMETER COSA,NOTADEB
PRIVATE COSA,NOTADEB
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
	IF NOTADEB
	?? 'N.DEB.' AT 23
	ELSE
	?? 'N.CRED.' AT 23
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
	SELE fac
	?
	?
	?
	?
	IF XSEEK(FAC.FACTURA,'CCL','NUMERORE')
	IF NOTADEB
		? "NOTA DE DEBITO CORRESPONDIENTE A LA FACTURA "
		ELSE
		? "NOTA DE CREDITO CORRESPONDIENTE A LA FACTURA "
		ENDIF
		?? SUCU+"-"
		NUFA=VAL(SUBSTR(CCL.COMPR,AT('§',CCL.COMPR)+1))
		NUFA=ZERO(NUFA,8)
		?? NUFA
		?
		? "EN CONCEPTO DE "
		?? UPPER(CCL.DETALLE)
	ENDIF
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
		=iaud('NOTA '+IIF(NOTADEB,'DEBITO','CREDITO ')+ALLTRIM(STR(fax.FACTURA))+' por IMPRESORA')
	ELSE
		=iaud('REIMP NOTA'+IIF(NOTADEB,'DEBITO ','CREDITO ')+ALLTRIM(STR(FAC.FACTURA)))
	ENDIF
else
	=iaudi()
endi
=MEN_LIN(BOTOM)
RETURN
