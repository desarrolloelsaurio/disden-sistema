******************************************************************************
*-- Programa: LDEBIP.PRG
*-- Fecha   : 10-16-92 05:49pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- MODIFICACION GOYO / LA MARTONA / CLAUDIO BALCALA
*-- Modificaci¢n GOYO 05-22-92 01:50am
*-- Modificaci¢n GOYO 06-09-92 03:22am (adaptacion a N. CRED)
*-- Modificaci¢n GOYO 10-01-92 06:02pm adaptaci¢n a PALADEM
*-- Modificaci¢n GOYO 10-04-92 08:07am agrega descuento
*-- Modificaci¢n GOYO adaptaci¢n a Nota de Cr‚dito
*-- Modificaci¢n GOYO adaptaci¢n a Nota de D‚bito
*-- VERSION PALADEM
********************************************************************************
PARAMETER COSA
PRIVATE COSA
ulpr=hora_ulp(program())
if cheqseg()
	SELE fac
	picu="9999.99"
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
	=CABPRI3P(1)
	PRINTJOB
	***************************************************
	?
	??? chr(14)
	?? 'N.DEB' AT 35
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
	?? alltrim(fac.codcli) AT 60
	=XSEEK(PER.ZONA,'MIX','ZONCOD')
	?? LEFT(MIX.TEXTO1,5) AT 72
	?
	? PER.domicilio at 8
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	?
	? alltrim(mix.texto1) at 8
	?? alltrim(str(MIX.nu2)) at 43
	=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
	??
	?? alltrim(mix.texto1) at 62
	?
	? PER.NROIVA AT 8
	?? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 43
	?
	?
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2
	? NADA
	SELE fac
	?
	?
	?
	SELE fax
	=LDEBI0()
	DO WHILE _PLINENO<41
		?
	ENDDO
	?
	?
	?
	? CHR(15)
	IF EMPTY(FAC.DESCUENTO)
		?? Fac.montobru pict PICU AT 67
	ELSE
		?? fac.monto pict PICU AT 24
		?? fac.DESCUENTO pict PICU AT 41
		?? fac.montobru pict PICU AT 75
	ENDIF
	?? fac.montoiva pict picu at 92
	?? fac.montoot2 pict picu at 110
	?? chr(18)
	?? '   '
	?? fac.montonet pict "99,999.99"
	_WRAP=.F.
	_lmargin=NUL
	?
	IF LEFT(JANNAME,5)="PALAD"
		? 'PALADEM S.R.L./CUIT:30-63667769-4' AT 40
	ENDIF
	EJECT PAGE
	ENDP
	=FINIMP()
	IF COSA
		=iaud('NOTA DEBITO '+ALLTRIM(STR(fax.FACTURA))+' por IMPRESORA')
	ELSE
		=iaud('REIMPRIME '+ALLTRIM(STR(FAC.FACTURA)))
	ENDIF
else
	=iaudi()
endi
=MEN_LIN(BOTOM)
RETURN
