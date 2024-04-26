******************************************************************************
*-- Programa: LLIQI.PRG
*-- Fecha   : 08/25/92
*-- Version : BANALOTTI
*-- Notas   : IMPRESION DE LIQUIDACION, POR IMPRESORA
********************************************************************************
PARAMETER COPIAS,COSA
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	PICU1='9999999.99'
	W=PAIP
	=impresor()
	STOR NUL TO casos
	c1=2
	c2=18
	c3=56
	c4=68
	c5=30
	C6=50
	SIGUE=.F.
	REGI=0
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
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
	_PCOPIES=COPIAS
	PRINTJOB
	***************************************************
	?
	?
	??? chr(14)
	?? 'LIQUIDACI¢N' AT 28
	?
	?
	?
	? far.fechaem AT 60
	?
	?
	?
	?
	SELE PRO
	IF XSEEK(FAR.PROCOD,'PRO','PROCOD')
		? FAR.PROCOD+' '+ALLTRIM(PRO.PROVEEDOR) AT 15
		? PRO.domicilio at 15
		=XSEEK(PRO.local,'MIX','CIUCOD')
		STORE mix.texto1 TO nada
		? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 15
		=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
		?? ' - '
		?? alltrim(mix.texto1)
		? ALLTRIM(XACIVA[PRO.CONDIVA,1]) AT 15
		?? PRO.NROIVA AT 50
		?
	ELSE
		?
		?
		?
		?
		?
	ENDIF
	? 'Liquidaci¢n de Remesa n§ '+str(naremes)+space(10)+'De Fecha '+dtoc(naferem)
	?
	?
	??? CHR(15)
	SELE FAD
	IF SEEK(FAR.FACTURA)
		stor RECNO() TO regi
		SIGUE=.T.
	ENDIF
	IF SIGUE
		GOTO regi
		SCAN whil FAR.factura=FAD.factura
			? fad.cantidad at c1 pictu '999999'
			?? fad.detalle at c2
			?? fad.monto   pictu PICU  at c3
			?? fad.monto*fad.cantidad pictu PICU  at c4
			sele fad
		ENDSCAN
	ENDIF
	DO WHILE _PLINENO<60
		?
	ENDDO
	? 'GASTOS' AT C1
	?? 'Total Ventas' at c6
	?? far.monto pictu PICU AT C4

	? 'Flete' AT C1
	?? NAFLET pictu PICU AT C5
	?? 'Comisi¢n' at c6
	?? far.descuento pictu PICU AT C4

	? 'Flete Vacio' AT C1
	?? NAVACI pictu PICU AT C5
	?? 'Subtotal' at c6
	?? far.montobru pictu PICU AT C4

	? 'Descarga' AT C1
	?? NADESC  pictu PICU AT C5
	?? 'I.V.A.' at c6
	?? far.MONTOIVA pictu PICU AT C4

	? 'Otros' AT C1
	?? NAOTRO  pictu PICU AT C5
	?? 'Gastos' at c6
	?? far.nogravado pictu PICU AT C4

	? 'TOTAL GASTOS' AT C1
	?? far.nogravado  pictu PICU AT C5
	?? 'Subtotal' AT C6
	?? far.montobru+far.montoiva-far.nogravado pictu PICU AT C4

	? 'IVA Servicios' at c6
	?? far.MONSEI pictu PICU AT C4

	? 'IVA Serv. N. Insc.' at c6
	?? far.MONSEN pictu PICU AT C4

	? 'NETO' at c6
	?? far.montobru+far.montoiva-far.nogravado-(far.MONSEI+far.MONSEN) pictu PICU AT C4
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	?
	ENDP
	=FINIMP()
	IF COSA
		=IAUD(ALLTRIM(FAR.FACTURA))
	ELSE
		=IAUD('REIMP.'+ALLTRIM(FAR.FACTURA))
	ENDIF
else
	=IAUDI()
endi
RETURN MEN_LIN(BOTOM)
