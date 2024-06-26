******************************************************************************
*-- Programa: LFACIGA
*-- Fecha   : 07/22/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS, POR IMPRESORA
*-- MODIFICACION GOYO / LA MARTONA / CLAUDIO BALCALA
*-- Modificación GOYO 05-22-92 01:50am
*-- Modificación GOYO 06-09-92 03:22am (adaptacion a N. CRED)
*-- Modificación GOYO 10-01-92 06:02pm adaptación a PALADEM
*-- Modificación GOYO 10-04-92 08:07am agrega descuento
*-- Modificación GOYO 17/12/92 Modificación a Guiper S.R.L.
*-- Modificación GOYO 30/12/92 Modificación Remito de Gambacurta
*-- Modificación GOYO 01-06-93 12:32pm Remito a Factura
********************************************************************************
PARAMETER COSA,conremi,NCRD
PRIVATE COSA,conremi,NCRD
ulpr=hora_ulp(program())
if cheqseg()
	sele fac
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
	STORE 1 TO VEZ
	PRINTJOB
	***************************************************
	?
	?? OFFNLQ
	? "┌"+REPL("─",38)+"┬"+REPL("─",38)+"┐"
	*
	? "│"
	?? PADC("DISTRIBUIDORA MELAC",38)
	?? "│"
	?? PADL("FACTURA",38)
	?? "│"
	*
	? "│"
	?? PADC("COMERCIALIZACION Y ELABORACION",38)
	?? "│"
	?? SPACE(38)
	?? "│"
	*
	? "│"
	?? PADC("DE PRODUCTOS ALIMENTICIOS LACTEOS",38)
	?? "│"
	?? PADL('Nž '+SUCU+"-"+ZERO(fac.factura,8),38)
	?? "│"
	*
	? "│"
	?? SPACE(38)
	?? "│"
	?? SPACE(38)
	?? "│"
	*
	? "│"
	?? PARSE("ALSINA 1889","TEL. 38-9177",38)
	?? "│"
	?? PADL('FECHA:'+DTOC(fac.fechaem),38)
	?? "│"
	*
	? "│"
	?? PADC("2000-ROSARIO",38)
	?? "│"
	?? SPACE(38)
	?? "│"
	*
	? "├"+REPL("─",38)+"┼"+REPL("─",38)+"┤"
	*
	? "│"
	?? SPACE(38)
	?? "│"
	?? PADR("CUIT        :  20-07634360-9",38)
	?? "│"
	*
	? "│"
	?? PADC("RESPONSABLE INSCRIPTO",38)
	?? "│"
	?? PADR("ING. BRUTOS :   021-241416-9",38)
	?? "│"
	*
	? "│"
	?? SPACE(38)
	?? "│"
	?? PADR("JUBILACION  :     EN TRAMITE",38)
	?? "│"
	*
	IF CONREMI
   	   ? "├"+REPL("─",38)+"┴"+REPL("─",38)+"┤"
	   ? "│"
	   ?? ' REMITOS:'
	   FOR ALX=1 TO ALEN(REMITOS,1)
		   IF REMITOS[ALX,3]
		      ?? ALLTRIM(STR(REMITOS[ALX,1]))
		      ?? '-'
		   ENDI
	   NEXT
	   ?? "│" AT 78
	   ? "└"+REPL("─",77)+"┘"
    ELSE
	   ? "└"+REPL("─",38)+"┴"+REPL("─",38)+"┘"
	ENDIF
	*
	?
	?
	SELE PER
	SET ORDER TO TAG CODCLI
	SEEK fac.codcli
	? "Sres.          :"+ALLTRIM(PER.cliente)
	IF LEN(ALLTRIM(PER.CLIENTE))<24
		?? " ("+alltrim(fac.codcli)+")"
	ENDIF
	? "Domicilio      :"+ALLTRIM(PER.domicilio)
	=XSEEK(PER.localidad,'mix','CIUCOD')
	STORE mix.texto1 TO nada
	?? ' - '+alltrim(mix.texto1)
	?? ' - '+alltrim(str(MIX.nu2))
	=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
	?? ' - '+alltrim(mix.texto1)
	? "Cond. I.V.A.   :"+ALLTRIM(XACIVA[PER.CONDIVA,1])
	?? PER.NROIVA AT 55
	=XSEEK(fac.condpago,'MIX','PAGCOD')
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA=ALLTRIM(STRTRAN(NADA,' ',''))
	stor mix.texto1 TO nada2
	? "Cond. Venta    :"+NADA
	=xseek(fac.codvia,'via','codvia')
	? PADR(PROPER(BIAJA),15)+":"+ALLTRIM(VIA.VIAJANTE)
	sele fac
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
	sele fax
	=SEEK(fac.factura)
	stor RECNO() TO regi
	STOR NUL TO nadacan,nadacanu,nadareg
	stor .T. TO lnada10
	stor .F. TO lnada12
	STOR NUL TO nadacant
	*******
	? REPL("=",79)
	? paip
	?? CHR(15)
	?? padc("CODIGO",9)
	?? paip
	?? PADC("CANTIDAD",11)
	?? paip
	?? PADC("FRACCION",11)
	?? paip
	?? PADC("DESCRIPCION",30)
	?? CHR(18)
	?? ' '
	?? paip
	?? PADC("Pcio. LISTA",10)
	?? paip
	?? PADC("Dto.",7)
	?? paip
	?? PADC("P. UNITARIO",9)
	?? paip
	?? PADC("IMPORTE",9)
	?? paip
	? REPL("=",79)
	*******
	SCAN whil fax.factura=fac.factura
		=XSEEK(fax.ARTICULO,'MER','ARTICULO')
		? paip
		?? CHR(15)
		?? LEFT(MER.ARTICULO,9)
		?? paip
		if mer.discrim
			?? STR(fax.UNIDADES,10)
			?? ' '
			?? paip
			?? STR(fax.CANTIDAD,10,2)
		else
			?? STR(fax.cantidad,10)
			?? " "
			?? paip
			?? space(10)
		endif
		?? ' '
		?? paip
		?? mer.merca
		?? CHR(18)
		?? ' '
		?? paip
		nadacant=nadacant+fax.CANTIDAD
		?? str(fax.MONTO,9,2)
		?? ' '
		?? paip
		porc=100*(1-(fax.MONTO1/fax.MONTO))
		?? str(porc,5,2)
		?? "% "
		?? paip
		?? STR(fax.MONTO1,9,2)
		?? paip
		?? STR(fax.MONTO1*fax.CANTIDAD,9,2)
		?? paip
	ENDS
	? REPL("=",79)
	? "SUBTOTAL    "
	?? fac.MONTO    pict "99,999.99" AT 69
	IF !EMPTY(FAC.DESCUENTO)
		? "DESCUENTO"
		?? fac.DESCUENTO pict "99,999.99" AT 69
	ENDIF
	? "NETO GRAVADO"
	?? Fac.montobru pict "99,999.99" AT 69
	? XACI[1]
	?? fac.montoiva pict "99,999.99" AT 69
	IF !EMPTY(FAC.MONTOOT2)
		? XACI[2]
		?? fac.montoot2 pict "99,999.99" AT 69
	ENDIF
	? REPL("=",79)
	? "TOTAL FACTURA"
	?? fac.montonet pict "99,999.99" AT 69
	****
	? REPL("=",79)
	_WRAP=.F.
	_lmargin=NUL
	?
	?
	?
	?
	EJECT PAGE

	ENDP
	=FINIMP()
	=iaud('REMITO '+ALLTRIM(STR(fax.factura))+' por IMPRESORA')
else
	=iaudi()
endi
=MEN_LIN(BOTOM)
RETURN
