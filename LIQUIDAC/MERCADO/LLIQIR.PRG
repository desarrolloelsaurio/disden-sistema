******************************************************************************
*-- Programa: LLIQR.PRG
*-- Fecha   : 08/25/92
*-- Version : BANALOTTI
*-- Notas   : IMPRESION DE RETENCION 7% SOBRE LIQUIDACION, POR IMPRESORA
*-- MODIFICACION GOYO 12-01-92 06:28pm
********************************************************************************
PARAMETER COPIAS,COSA
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	W=PAIP
	NURET=SPACE(12)
	=MOVEWINN(17,40,19,70,'ALGO')
	@ 1,1 SAY 'N§ RETENCION:' COLO SCHE 3
	@ 1,15 GET NURET PICT '@!'
	READ
	FIN=SAY_NUM(far.montoper)
	if len(fin) > 53
		fin1=left(fin,53)
		fin1=left(fin,rat(' ',fin1))
		fin2=substr(fin,len(fin1)+1)
	else
		fin1=fin
		fin2=""
	endif
	fin1=padr(alltrim(fin1),53,"*")
	fin2=padr(alltrim(fin2),53,"*")
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
	?
	?
	?
	? far.fechaem AT 60
	?
	? "N§ "+NURET  AT 10
	?
	? 'CONSTANCIA DE RETENCION I.V.A. R. GRAL. D.G.I. N§ 3452/92 ' AT 20
	?
	SELE PRO
	IF XSEEK(FAR.PROCOD,'PRO','PROCOD')
		? FAR.PROCOD+' '+ALLTRIM(PRO.PROVEEDOR) AT 15
		? PRO.domicilio at 15
		=XSEEK(PRO.local,'MIX','CIUCOD')
		STORE mix.texto1 TO nada
		? alltrim(mix.texto1)+" ("+alltrim(str(MIX.nu2))+")" at 15
		=XSEEK(RIGHT(mix.TEXTO2,2),'MIX','PRVCOD')
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
	?
	?
	?
	SELE FAR
	?
	? 'Por la presente certificamos haber retenido la suma de $'+ALLTRIM(str(far.montoper,14,2))+','
	? 'Son pesos '+fin1
	? fin2
	? 'en concepto de I.V.A. seg£n Resoluci¢n General (DGI) N§ 3452/92, '
	? 'correspondiente a nuestra Liquidaci¢n N§ '+ALLTRIM(far.factura)+' de fecha: '+dtoc(far.fechaem)+'.-'
	?
	?
	? 'P/ '+janname at 60
	_WRAP=.F.
	_lmargin=NUL
	?
	EJECT PAGE
	?
	ENDP
	=FINIMP()
	IF COSA
		=iaud('Ret. Liq. '+ALLTRIM(far.factura))
	ELSE
		=iaud('Reimp. '+ALLTRIM(FAR.FACTURA)
	ENDIF
else
	=iaudi()
endi
=RELEWIN('ALGO')
=MEN_LIN(botom)
RETURN
