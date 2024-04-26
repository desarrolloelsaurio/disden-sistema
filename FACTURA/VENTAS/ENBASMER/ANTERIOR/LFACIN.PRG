***************************************************************************
*-- Programa: LFACIg.PRG
*-- Fecha   : 07/22/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- MODIFICACION GOYO / LA MARTONA / CLAUDIO BALCALA
*-- Modificaci¢n GOYO 05-22-92 01:50am
*-- Modificaci¢n GOYO 06-09-92 03:22am (adaptacion a N. CRED)
*-- Modificaci¢n GOYO 10-01-92 06:02pm adaptaci¢n a PALADEM
*-- Modificaci¢n GOYO 10-04-92 08:07am agrega descuento
*-- Modificaci¢n GOYO 17/12/92 Modificaci¢n a Guiper S.R.L.
********************************************************************************
PARAMETER COSA,conremi,NCRD
PRIVATE COSA,conremi,NCRD
ulpr=hora_ulp(program())
if cheqseg()
	SELE fac
	picu="9999.99"
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
	c6=60
	=cabpri3P(1)
	PRINTJOB
	***************************************************
	?
	?
	?
	??? CHR(18)
	??? chr(14)
	IF NCRD
		?? 'N. CREDITO' AT 27
	ELSE
		?? 'FACTURA' AT 27
	ENDIF
	? fac.fechaem AT 65
	?
	?
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	? ALLTRIM(PER.cliente) AT 15
	IF LEN(ALLTRIM(PER.CLIENTE))<24
   	   ?? " ("+alltrim(fac.codcli)+")"
	ENDIF
	=xseek(fac.codvia,'via','codvia')
	?? ALLTRIM(VIA.VIAJANTE) AT 55
	? ALLTRIM(PER.domicilio) AT 15
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	?? ' - '+alltrim(mix.texto1)
	?? ' - '+alltrim(str(MIX.nu2))
	=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '+alltrim(mix.texto1)
	? ALLTRIM(XACIVA[PER.CONDIVA,1]) AT 15
	?? PER.NROIVA AT 55
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2
	? NADA AT 15
	if conremi
	?? CHR(15)
		?? '-' AT 75
		FOR ALX=1 TO ALEN(REMITOS,1)
			IF REMITOS[ALX,3]
				?? ALLTRIM(STR(REMITOS[ALX,1]))
				?? '-'
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
		?? LEFT(MER.ARTICULO,9)
		if mer.discrim
			?? STR(FAX.unidades,10)
			?? '  '
			?? STR(FAX.CANTIDAD,10,2)
		else
			?? STR(FAX.cantidad,10)
			?? space(12)
		endif
		?? '  '
		?? mer.merca
		?? CHR(18)
		?? '  '
		nadacant=nadacant+FAX.CANTIDAD
		?? str(fax.monto,9,2)
		?? '  '
		porc=100*(1-(fax.monto1/fax.monto))
		?? str(porc,5,2)
		?? "% "
		?? STR(FAX.MONTO1,9,2)
		?? " "
		?? STR(FAX.MONTO1*FAX.CANTIDAD,9,2)
	ENDS
	DO WHILE _PLINENO<44
		?
	ENDDO
	=xseek(fac.codvia,'via','codvia')
	? CHR(15)
	?
	IF EMPTY(FAC.DESCUENTO)
		?? fac.monto pict PICU AT 9
		?? Fac.montobru pict PICU AT 64
	ELSE
		?? fac.monto pict PICU AT 9
		?? fac.DESCUENTO pict PICU AT 47
		?? fac.montobru pict PICU AT 64
	ENDIF
	?? fac.montoiva pict picu at 82
	?? fac.montoot2 pict picu at 100
	?? chr(18)
	?? '    '
	?? fac.montonet pict "99,999.99"
	_WRAP=.F.
	_lmargin=NUL
	?
	?
	?
	?
	? CHR(15)
	?? 'SISTEMA PROVISTO POR SISTEMAS INFORMATICOS S.R.L. A GUIPER DISTRIBUCIONES S.R.L. / CUIT: 30-65745988-3'
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
